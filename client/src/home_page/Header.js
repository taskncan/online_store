import React,{Component} from "react";
import {
    BrowserRouter as Router,
    Switch,
    Route,
    Link
} from "react-router-dom";
import Product from "./Product";
import Categories from "./Categories"
import LoginForm from "../login/LoginForm"
import RegisterForm from "../login/RegisterForm"
import SellerProfile from "../seller_profile/SellerProfile"
import UserProfile from "../user_profile/UserProfile"

import 'bootstrap/dist/css/bootstrap.min.css';
import '../index.css';

class Header extends Component{
    //You can connect your codes from here with href on a
    //
    render() {
        return (
        <Router>
          <header>
            <nav className="navbar navbar-expand-lg navbar-dark bg-dark">
              <div className="container">
              <button className="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarNavAltMarkup" aria-controls="navbarNavAltMarkup" aria-expanded="false" aria-label="Toggle navigation">
                <span className="navbar-toggler-icon"></span>
              </button>
                <div className="collapse navbar-collapse" id="navbarNavAltMarkup">
                  <div className="navbar-nav">
                    <Link className="nav-item nav-link" to="/login">Login</Link>
                    <Link className="nav-item nav-link" to="/register">Register</Link>
                    <Link className="nav-item nav-link" to="/user">User</Link>
                    <Link className="nav-item nav-link" to="/categories">Categories</Link>
                    <Link className="nav-item nav-link" to="/">Basket</Link>
                    <Link className="nav-item nav-link" to="/products">Product Details</Link>
                    <Link className="nav-item nav-link" to="/">Payment</Link>
                    <Link className="nav-item nav-link" to="/seller">Seller</Link>
                  </div>
              </div>
            </div>
            </nav>
          </header>
            <Switch>
              <Route path="/login">
                <Login></Login>
              </Route>
              <Route path="/products">
                <Products />
              </Route>
              <Route path="/register">
                <Register/>
              </Route>
              <Route path="/categories">
                <Category/>
              </Route>
              <Route path="/seller">
                  <Seller></Seller>
              </Route>
              <Route path="/user">
                  <User></User>
              </Route>
            </Switch>
        </Router>
      )};
    }
    
    function Products(props) {
      return <Product ></Product>;
    }

    function Register(props){
        return <RegisterForm/>
    }

    function Login(props){
        return <LoginForm></LoginForm>
    }

    function Category(props){
        return <Categories/>;
    }

    function Seller(props){
        return <SellerProfile></SellerProfile>
    }

    function User(props){
        return <UserProfile></UserProfile>
    }
    
export default Header