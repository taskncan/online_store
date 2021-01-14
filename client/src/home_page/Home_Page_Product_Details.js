import React from "react";

function Product_Details(props) {

    let styleDiv ={
            textAlign:"center",
            width:"100%",
            height: "20%"};

    let styleImage =
        {
            width:"20%",
            height:"100%"
        };

    return(
        <tr>
          <td>
            {props.title}
          </td>
          <td>
            <img className="img-responsive rounded-circle" width="150" height="150" src={props.imageLink}></img>
          </td>
          <td>
            {props.price}
          </td>
          <td>
            {props.description}
          </td>
          <td>
            {props.delivery_time} days
          </td>
          <td>
            {props.category}
          </td>
        </tr>
    );

}

export default Product_Details;