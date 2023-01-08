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

export const updateProduct = async (req: Request, res: Response, next: NextFunction) => {
    const [updateErr] = await promiseHandler(ProductModel.findOneAndUpdate({ productId: req.params.id }, req.body.product));

    if (updateErr) {
        return next(new HttpError(ERROR_INTERNAL_SERVER, 500));
    }

    return res.status(200).json(req.body.product);
}

export const deleteProduct = async (req: Request, res: Response, next: NextFunction) => {
    const [deleteErr] = await promiseHandler(ProductModel.findOneAndDelete({ productId: req.params.id }));

    if (deleteErr) {
        return next(new HttpError(ERROR_INTERNAL_SERVER, 500));
    }

    return res.status(200).json(req.params.id);
}

export const getProduct = async (req: Request, res: Response, next: NextFunction) => {
    const [getErr, doc] = await promiseHandler(ProductModel.findOne({ productId: req.params.id }));

    if (getErr) {
        return next(new HttpError(ERROR_INTERNAL_SERVER, 500));
    }

    return res.status(200).json(doc);
}