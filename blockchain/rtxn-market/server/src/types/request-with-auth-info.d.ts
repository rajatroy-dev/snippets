import { Request } from "express";

export interface IRequestWithAuthInfo extends Request {
    user?: string // or any other type
}