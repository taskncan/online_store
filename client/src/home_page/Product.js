import React from 'react';
import Product_Details from './Home_Page_Product_Details'
class Product extends React.Component{

    constructor(props) {
        super(props);
        //our states
        this.state ={
            items:[],
            isLoaded : false
        };
    }

    // function to get data from api
    callAPI()
    {
       fetch("http://localhost:161/Products")
           .then(res => res.json())
           .then(json => {
               this.setState({
                   isLoaded:true,
                   items:json
               })
           })
    }

    //componenet will mount so get the data
    componentWillMount() {
        this.callAPI();
    }

    render() {
       var {isLoaded,items } = this.state;

       if(!isLoaded)
       {
           return <div style={{textAlign:"center"}}>Loading..</div>
       }
       else
       {
           return(
            <table className="table">
                <thead>
                <tr>
                    <th>Title</th>
                    <th>Image</th>
                    <th>Price</th>
                    <th>Description</th>
                    <th>Delivery Time</th>
                    <th>Category</th>
                </tr>
                </thead>
                <tbody>
                    {
                        items.map(item => (
                            <Product_Details
                                key={item.product_id}
                                title={item.product_title}
                                imageLink ={item.product_image_link}
                                price = {item.product_price}
                                quantity={item.product_quantity}
                                description={item.product_description}
                                delivery_time={item.product_delivery_time}
                                category = {item.product_category}>
                            </Product_Details>
                    ))}    
                </tbody>
            </table>
           )
       }

    }
}


export default Product;
