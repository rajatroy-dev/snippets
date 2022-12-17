// https://rogerio-oliveira.medium.com/an-alternative-way-to-use-async-await-without-try-catch-blocks-in-node-js-3eac93fd8e1
const promiseHandler = (promise: Promise<never>): Promise<never[]> => {
    return promise
        .then((data: never): never[] => [undefined, data])
        .catch((err: never): never[] => [err]);
}

export default promiseHandler;