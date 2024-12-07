import axios, { AxiosError, AxiosRequestConfig, AxiosResponse } from "axios";
import * as log4js from "log4js";

log4js.configure({
  appenders: {
    app: {
      type: "dateFile",
      filename: "./logs/app.log",
      numBackups: 7,
      compress: true,
      alwaysIncludePattern: false
    },
  },
  categories: {
    default: { appenders: ["app"], level: process.env.LOG_LEVEL || "INFO" },
  },
});
const logger = log4js.getLogger();

const axiosConfig: AxiosRequestConfig = {
  url: "https://ipv4.mydns.jp/login.html",
  method: "GET",
  auth: {
    username: process.env.USERNAME || "",
    password: process.env.PASSWORD || "",
  },
};

axios
  .request(axiosConfig)
  .then((res: AxiosResponse) => {
    const match = /<DT>REMOTE ADDRESS:<\/DT><DD>(.*?)<\/DD>/m.exec(res.data);
    logger.info(`${res.status}\t${match![1]}`);
  })
  .catch((err: AxiosError) => {
    logger.error(`${err.status}\t${err.stack}`);
  });
