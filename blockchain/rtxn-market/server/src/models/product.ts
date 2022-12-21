import { getModelForClass, prop } from "@typegoose/typegoose";

class Product {
    @prop({ required: true, unique: true })
    public productId!: string;

    @prop({ required: true })
    public title!: string;

    @prop({ required: true })
    public description!: string;

    @prop({ required: true })
    public price!: number;

    @prop({ required: true })
    public discountPercentage!: number;

    @prop({ required: true })
    public rating!: number;

    @prop({ required: true })
    public stock!: number;

    @prop({ required: true })
    public brand!: string;

    @prop({ required: true })
    public category!: string;

    @prop({ required: true })
    public thumbnail!: string;

    @prop()
    public images!: string[];
}

const ProductModel = getModelForClass(Product);

export default ProductModel;