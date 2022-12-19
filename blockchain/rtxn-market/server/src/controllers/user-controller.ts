import { compare, hash } from "bcrypt";
import { config } from "dotenv";
import {
    NextFunction,
    Request,
    Response
} from "express";
import { sign, verify } from "jsonwebtoken";

import UserModel from "../models/user";
import HttpError from "../models/http-error";
import { IRequestWithAuthInfo } from "../types/request-with-auth-info";
import { IVerifyTokenUser } from "../types/verify-token-user";
import { ROLE } from "../utils/enums";
import promiseHandler from "../utils/promise-handler";
import { IUser } from "../types/user";

config();

const signUp = async (req: Request, res: Response, next: NextFunction) => {
    const [hashErr, hashed] = await promiseHandler(hash(req.body.password, parseInt(process.env.SALT_ROUNDS)));
    if (hashErr) {
        return next(new HttpError('Something Went Wrong!', 500));
    }

    const user = {
        name: req.body.name,
        gender: req.body.gender,
        dateOfBirth: req.body.dateOfBirth,
        email: req.body.email,
        role: req.body.role && req.body.role === 'ADMIN' ? ROLE.ADMIN : ROLE.USER,
        username: req.body.username,
        password: hashed,
    };

    const [createErr] = await promiseHandler(UserModel.create(user));
    if (createErr) {
        return next(new HttpError('Something Went Wrong!', 500));
    }

    const responsePayload = {
        username: req.body.username,
        name: req.body.name,
        token: '',
    };

    sign(
        { username: req.body.username, name: req.body.name },
        process.env.JWT_SECRET,
        {
            expiresIn: "2h",
        },
        (err, encoded) => {
            if (err) {
                return next(new HttpError('Something Went Wrong!', 500));
            }

            responsePayload.token = encoded;
            return res.status(201).json(responsePayload);
        }
    );
}

const login = (req: Request, res: Response, next: NextFunction) => {
    UserModel.findOne({ username: req.body.username }, async (err: never, user: IUser) => {
        if (err) {
            return next(new HttpError('Something Went Wrong!', 500));
        }

        if (!user) {
            return next(new HttpError('User not found!', 404));
        }

        const [compareErr, isValid] = await promiseHandler(compare(req.body.password, user.password));
        if (compareErr) {
            return next(new HttpError('Something Went Wrong!', 500));
        }

        if (!isValid) {
            return next(new HttpError('Incorrect password!', 403));
        }

        const responsePayload = {
            username: req.body.username,
            name: user.name,
            token: '',
        };

        sign(
            { username: req.body.username, name: user.name },
            process.env.JWT_SECRET,
            {
                expiresIn: "2h",
            },
            (err, encoded) => {
                if (err) {
                    return next(new HttpError('Something Went Wrong!', 500));
                }

                responsePayload.token = encoded;
                return res.status(200).json(responsePayload);
            }
        );
    });
}

const isAuthenticated = (req: IRequestWithAuthInfo, _: Response, next: NextFunction) => {
    const bearerToken = req.get('Authorization');
    if (!bearerToken) { // Check if it is `undefined`
        return next(new HttpError('Unauthorized!', 401));
    }

    const token = bearerToken.slice('Bearer '.length);
    verify(token, process.env.JWT_SECRET, (err: never, tokenUser: IVerifyTokenUser) => {
        if (err) {
            return next(new HttpError('Unauthorized!', 401));
        }

        tokenUser.username && UserModel.findOne({ username: tokenUser.username }, async (err: never, user: IUser) => {
            if (err) {
                return next(new HttpError('Something Went Wrong!', 500));
            }

            if (!user) {
                return next(new HttpError('Unauthorized!', 401));
            }

            if (tokenUser.name !== user.name
                || tokenUser.username !== user.username) {
                return next(new HttpError('Forbidden!', 403));
            }

            delete user.password;
            req.user = user;

            return next();
        });
    });
}

export { isAuthenticated, login, signUp };