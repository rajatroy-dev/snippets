import { check } from "express-validator";

import {
    VALIDATION_DOB,
    VALIDATION_EMAIL,
    VALIDATION_GENDER,
    VALIDATION_NAME,
    VALIDATION_PASSWORD,
    VALIDATION_ROLE,
    VALIDATION_USERNAME
} from "../shared/constants";
import {
    GENDER,
    ROLE
} from "../utils/enums";

// https://dev.to/nedsoft/a-clean-approach-to-using-express-validator-8go

export const signUpValidation = () => {
    return [
        check('email')
            .isEmail()
            .withMessage(VALIDATION_EMAIL),
        check('password')
            .isStrongPassword({
                minLength: 8,
                minLowercase: 1,
                minUppercase: 1,
                minNumbers: 1,
                minSymbols: 1,
                returnScore: false
            })
            .withMessage(VALIDATION_PASSWORD),
        check('name')
            .matches(/^[A-Za-z. ]+$/)
            .withMessage(VALIDATION_NAME),
        check('gender')
            .isIn([GENDER.MALE, GENDER.FEMALE, GENDER.OTHERS])
            .withMessage(VALIDATION_GENDER),
        check('dateOfBirth')
            .isISO8601().toDate()
            .withMessage(VALIDATION_DOB),
        check('role')
            .optional()
            .isIn([ROLE.ADMIN, ROLE.USER])
            .withMessage(VALIDATION_ROLE),
        check('username')
            .matches(/^[A-Za-z0-9_]+$/)
            .withMessage(VALIDATION_USERNAME),
    ];
}

export const loginValidation = () => {
    return [
        check('password')
            .isStrongPassword({
                minLength: 8,
                minLowercase: 1,
                minUppercase: 1,
                minNumbers: 1,
                minSymbols: 1,
                returnScore: false
            })
            .withMessage(VALIDATION_PASSWORD),
        check('username')
            .matches(/^[A-Za-z0-9_]+$/)
            .withMessage(VALIDATION_USERNAME),
    ];
}