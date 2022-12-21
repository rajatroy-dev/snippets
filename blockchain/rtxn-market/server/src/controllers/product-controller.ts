import { randomBytes } from "crypto";
import {
    NextFunction,
    Request,
    Response
} from "express";

import HttpError from "../models/http-error";
import ProductModel from "../models/product";
import { ERROR_INTERNAL_SERVER } from "../shared/constants";
import promiseHandler from "../utils/promise-handler";

export const addProduct = async (req: Request, res: Response, next: NextFunction) => {
    const productId = randomBytes(16).toString("hex");
    req.body.product.productId = productId;
    let [createErr, addedProduct] = await promiseHandler(ProductModel.create(req.body.product));

    let retry = 0;
    while (createErr?.code === 11000 && retry < 5) {
        const newProductId = randomBytes(16).toString("hex");
        req.body.product.productId = newProductId;
        [createErr, addedProduct] = await promiseHandler(ProductModel.create(req.body.product));
        retry++;

        if (!createErr) break;
    }

    if (createErr?.code === 11000) {
        return next(new HttpError(ERROR_INTERNAL_SERVER, 500));
    }

    return res.status(201).json(addedProduct);
}