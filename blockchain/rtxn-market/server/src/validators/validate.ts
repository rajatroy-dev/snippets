import { NextFunction, Request, Response } from "express";
import { validationResult } from "express-validator";

const validate = (req: Request, res: Response, next: NextFunction) => {
    const errors = validationResult(req);
    if (errors.isEmpty()) {
        return next();
    }
    const extractedErrors = {};
    errors.array().map(err => extractedErrors[err.param] = err.msg);

    return res.status(400).json({
        errors: extractedErrors,
    });
}

export default validate;