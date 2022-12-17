import { config } from "dotenv";
import {
    NextFunction,
    Request,
    Response
} from "express";
import { verify } from "jsonwebtoken";

import HttpError from "../models/http-error";
import { IRequestWithAuthInfo } from "../types/request-with-auth-info";

config();

const signUp = (req: Request, res: Response, next: NextFunction) => {
    return "";
}

const isAuthenticated = (req: IRequestWithAuthInfo, _: Response, next: NextFunction) => {
    const bearerToken = req.get('Authorization');
    if (!bearerToken) { // Check if it is `undefined`
        return next(new HttpError('Unauthorized', 401));
    }

    const token = bearerToken.slice('Bearer '.length);
    verify(token, process.env.JWT_SECRET, (err: never, user: never) => {
        if (err) {
            return next(new HttpError('Unauthorized', 401));
        }

        req.user = user;
        return next();
    });
}

export { isAuthenticated, signUp };