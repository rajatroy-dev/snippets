// https://rogerio-oliveira.medium.com/an-alternative-way-to-use-async-await-without-try-catch-blocks-in-node-js-3eac93fd8e1
const promiseHandler = (promise) => {
    return promise
        .then((data) => [undefined, data])
        .catch((err) => [err]);
}

export default promiseHandler;