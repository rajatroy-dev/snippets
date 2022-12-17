import {
    getModelForClass,
    prop
} from "@typegoose/typegoose";

import { GENDER, ROLE } from "../utils/enums";

// https://typegoose.github.io/typegoose/docs/api/decorators/prop/
class User {
    @prop({ required: true })
    public name!: string;

    @prop({ required: true, enum: GENDER })
    public gender!: string;

    @prop({ required: true })
    public dateOfBirth!: string;

    @prop({ required: true, unique: true })
    public email!: string;

    @prop({ required: true, enum: ROLE, default: ROLE.USER })
    public role!: string;

    @prop({ required: true, unique: true })
    public username!: string;

    @prop({ required: true })
    public password!: string;
}

const UserModel = getModelForClass(User);

export default UserModel;