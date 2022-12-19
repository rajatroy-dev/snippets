import { Router } from 'express';

import { login, signUp } from '../controllers/user-controller';

const userRoutes = Router();

userRoutes.post('/signup', signUp);
userRoutes.post('/login', login);

export default userRoutes;