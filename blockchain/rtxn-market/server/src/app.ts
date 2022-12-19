import { config } from "dotenv";
import express, {
    NextFunction,
    Request,
    Response
} from 'express';
import mongoose from 'mongoose';

import rTxnToken from './contracts/RTxnToken.json';
import { isAuthenticated } from './controllers/user-controller';
import HttpError from './models/http-error';
import userRoutes from "./routes/user-routes";

config();
const app = express();
const port = 3000;

app.use(express.json());

app.use('/auth', userRoutes);

app.use(isAuthenticated);

app.get('/', (req, res) => {
    res.send('Hello World!');
});

// 404. No routes found
app.use((_: Request, __: Response, next: NextFunction) => {
    next(new HttpError('API not found!', 404));
});

// Error
app.use((error: HttpError, _: Request, res: Response, next: NextFunction): void => {
    if (res.headersSent) {
        return next(error);
    }

    res.status(error.code || 500);
    res.json({ error: error.message || 'An unknown error has occured!' });
});

mongoose.connect(process.env.MONGODB_CONNECTION_STRING).then(() => {
    app.listen(port, () => {
        return console.log(`Express is listening at http://localhost:${port}`);
    });
}).catch((err) => {
    console.error(`Connection to MongoDB failed with error: ${err}`);
});