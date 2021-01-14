import React,{Component} from 'react';

class Categories extends React.Component {

    constructor(props) {
        super(props);

        this.state =
            {
                items: [],
                isLoaded: false
            };

    };

    callAPI() {
        fetch("http://localhost:161/categories")
            .then(res => res.json())
            .then(json => {
                this.setState({
                    isLoaded: true,
                    items: json
                })
            })


    }

    //componenet will mount so get the data
    componentWillMount() {
        this.callAPI();
    }



    render() {
        var {isLoaded,items } = this.state;
    //if we still fetching data show loading on the site
        if(!isLoaded)
        {
            return <div style={{textAlign:"center"}}>Loading..</div>
        }
        else
        {
            return(
                         <div style={{textAlign:"center"}}>
                        <hr/>

                        <ul>


                            {
                                //for each item create a li
                                items.map(item => (
                            <li key={item.category_id}>
                            {item.category_name}
                            </li>

                        ))}

                        </ul>

                </div>
            )
        }

    }

}
export default Categories;