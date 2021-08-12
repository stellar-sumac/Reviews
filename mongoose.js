  import mongoose from 'mongoose';
  const { Schema } = mongoose;

  const Reviews = new Schema({
    id:  { type: Number, unique: true }, // String is shorthand for {type: String}
    response: { type: String, required: true },
    body: { type: String, required: true },
    summary: { type: String, required: true },
    postdate: { type: Date, default: Date.now },
    helpfulness:  { type: Number, default: 0 },
    reviewer: {type: String, required: true },
    productID: { type: Number, required: true },
    email: { type: String, default: 'anonymous' },
    recommended: { type: Boolean, default: false },
    reported: { type: Boolean, default: false },
    characteristics: {
      type: Map,
      of: { id: Number, value: Number },
    },

    ratings: { type: Number, default: 5 },
    photos: [{imageURL: String, id: Number}]


  });

//{ "Size" : { "id": 14, "value": "4.000" }

