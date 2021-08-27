
<br />
<p align="center">
  <a href="https://github.com/vaibhavpras/AiLonmusk-frontend">
    <img src="https://raw.githubusercontent.com/vaibhavpras/AiLonmusk-frontend/master/web/icons/Icon-192.png" alt="Logo" width="80" height="80">
  </a>

  <h3 align="center">AiLon Musk</h3>

  <p align="center">
    Make Elon Musk tweet about anything!
    <br />
  <a href="https://ailonmusk.netlify.app">ailonmusk.netlify.app</a>
  </p>
</p>





## About The Project

AiLon Musk is a web-app that lets you generate fake tweets in line with something that Elon Musk would tweet. It uses a technology called GPT-2 which stands for “Generative Pretrained Transformer 2”. It basically works by training a model to predict the next word in a sequence of words in an unsupervised way. In this implementation, the model is trained using Elon Musk's publicly available data, with the main sources being his tweets, interviews, speeches, podcasts and Tesla shareholder meetings.

## Built With


* [Flutter Web](https://flutter.dev/web)
* [GPT-2 cloud run API](https://github.com/minimaxir/gpt-2-cloud-run)
* [Python](https://www.python.org/)
* [Google Colab](https://colab.research.google.com)
* [Docker](https://www.docker.com/)
* [Google Cloud Platform](https://cloud.google.com/)
* [Netlify](https://netlify.com)


## Getting Started



### Prerequisites

* [Flutter](https://flutter.dev/docs/get-started/install)
 
### Installation

1. Clone the repo
   ```sh
   git clone https://github.com/vaibhavpras/ailonmusk
   ```
2. Navigate to the project directory
   ```sh
   cd ailonmusk
   ```
3. To serve your app from `localhost` in Chrome, enter the following in the project directory:
   ```sh
    flutter run -d chrome
   ```


## Usage

Demo can be found at: [ailonmusk.netlify.app](https://ailonmusk.netlify.app)

Type in any word in the ```about``` prompt to set that word as the seed for the tweet generation. Longer strings will generate more cohesive tweets.

<img src="https://raw.githubusercontent.com/vaibhavpras/AiLonmusk-frontend/master/demoimages/demo1.jpg" alt="Logo" width=300 height=500>

Prompt can also be left blank to get random tweets.

<img src="https://raw.githubusercontent.com/vaibhavpras/AiLonmusk-frontend/master/demoimages/demo2.jpg" alt="Logo" width=300 height=500>

## Tweet Generator API [Backend]
Information about the backend of this web-app and the API endpoint can be found at: https://github.com/vaibhavpras/AiLonmusk-API
<!-- LICENSE -->
## License

Distributed under the MIT License

