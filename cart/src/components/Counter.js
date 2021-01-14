import React, { Component } from "react";
import PropTypes from "prop-types";

class Counter extends Component {
  constructor(props) {
    super(props);
    this.state = { value: this.props.productQuantity,
     id : this.props.id,
    price : this.props.price};
    this.increment = this.increment.bind(this);
    this.decrement = this.decrement.bind(this);
  }

  increment(e) {
    this.setState(
      prevState => ({
        value: Number(prevState.value) + 1
      }),
      function() {
        this.props.updateQuantity(this.state.value, this.state.id, this.state.price, true);
      }
    );
    e.preventDefault();
  }

  decrement(e) {
    e.preventDefault();
    if (this.state.value <= 0) {
        this.props.updateQuantity(this.state.value, this.state.id, this.state.price);
    } else {
      this.setState(
        prevState => ({
          value: Number(prevState.value) - 1
        }),
        function() {
          this.props.updateQuantity(this.state.value, this.state.id, this.state.price);
        }
      );
    }
  }

  feed(e) {
    this.setState(
      {
        value: this.refs.feedQty.value
      },
      function() {
        this.props.updateQuantity(this.state.value);
      }
    );
  }

  resetQuantity() {
    this.setState({
      value: 1
    });
  }
  render() {

    return (
      <div className="stepper-input">
        <a href="#" className="decrement" onClick={this.decrement}>
          –
        </a>
        <input
          ref="feedQty"
          type="number"
          className="quantity"
          value={this.state.value}
          onChange={this.feed.bind(this)}
        />
        <a href="#" className="increment" onClick={this.increment}>
          +
        </a>
      </div>
    );
  }
}

Counter.propTypes = {
  value: PropTypes.number
};

export default Counter;
