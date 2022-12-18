import { compare, genSalt, hash } from "bcrypt";
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
import { ROLE } from "../utils/enums";
import promiseHandler from "../utils/promise-handler";

config();

const signUp = async (req: Request, res: Response, next: NextFunction) => {
    const [saltErr, salt] = await promiseHandler(genSalt(process.env.SALT_ROUNDS as unknown as number));
    if (saltErr) {
        return next(new HttpError('Something Went Wrong!', 500));
    }

    const [hashErr, hashed] = await promiseHandler(hash(req.body.password, salt));
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

const login = async (req: Request, res: Response, next: NextFunction) => {
    const [userErr, user] = promiseHandler(UserModel.findOne({ username: req.body.username }));
    if (userErr) {
        return next(new HttpError('Something Went Wrong!', 500));
    }

    const [hashErr, hashed] = await promiseHandler(hash(req.body.password, process.env.SALT_ROUNDS as unknown as number));
    if (hashErr) {
        return next(new HttpError('Something Went Wrong!', 500));
    }

    const [compareErr, isValid] = await promiseHandler(compare(user.password, hashed));
    if (compareErr) {
        return next(new HttpError('Something Went Wrong!', 500));
    }

    if (!isValid) {
        return next(new HttpError('Forbidden!', 403));
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
}

const isAuthenticated = (req: IRequestWithAuthInfo, _: Response, next: NextFunction) => {
    const bearerToken = req.get('Authorization');
    if (!bearerToken) { // Check if it is `undefined`
        return next(new HttpError('Unauthorized!', 401));
    }

    const token = bearerToken.slice('Bearer '.length);
    verify(token, process.env.JWT_SECRET, (err: never, user: never) => {
        if (err) {
            return next(new HttpError('Unauthorized!', 401));
        }

        req.user = user;
        return next();
    });
}

export { isAuthenticated, login, signUp };