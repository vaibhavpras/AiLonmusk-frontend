import React, { Component } from 'react'
import axios from 'axios'

class PostForm extends Component {
    constructor(props){
        super (props)
        this.state = {
            prefix: '',
            nsamples: 1,
        }
    }

    changeHandler = (e) => {
        this.setState({[e.target.name]: e.target.value})
    }

    submitHandler = e => {
        e.preventDefault()
        console.log(this.state)
        axios.post('https://cors-anywhere.herokuapp.com/https://ailonmuskapi-6uxbltfubq-uc.a.run.app', this.state)
            .then(response=>{
                console.log(response)
            })
            .catch(
            error => console.log(error)
        )
    }
    render() {
        const {prefix, nsamples} = this.state
        return (
            <div>
                <form onSubmit={this.submitHandler}>
                    <div>
                        <input type = "text" name = "prefix" value = {prefix} onChange={this.changeHandler}></input>
                    </div>
                    <div>
                        <input type = "text" name = "nsamples" value = {nsamples} onChange={this.changeHandler}></input>
                    </div>
                    <button type = "submit">Submit</button>
                </form>
                
            </div>
        )
    }
}

export default PostForm
