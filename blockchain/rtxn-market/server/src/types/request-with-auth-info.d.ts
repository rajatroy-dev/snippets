import { Request } from "express";
import { IUser } from "./user";

export interface IRequestWithAuthInfo extends Request {
    user?: IUser // or any other type
}