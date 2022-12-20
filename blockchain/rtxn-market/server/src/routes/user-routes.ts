import { Router } from 'express';

import {
    login,
    signUp
} from '../controllers/user-controller';
import {
    loginValidation,
    signUpValidation
} from '../validators/user-validator';
import validate from '../validators/validate';


const userRoutes = Router();

userRoutes.post('/signup', signUpValidation(), validate, signUp);
userRoutes.post('/login', loginValidation(), validate, login);

export default userRoutes;