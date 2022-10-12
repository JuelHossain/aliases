#!/usr/bin/bash

npm install react-router-dom localforage match-sorter sort-by

touch src/router.jsx

# modifiying main.jsx file
echo '
import React from "react";
import ReactDOM from "react-dom/client";
import router from "./router"
import "./index.css";
import { RouterProvider } from "react-router";

ReactDOM.createRoot(document.getElementById("root")).render(
  <React.StrictMode>
    <RouterProvider router={router} />
  </React.StrictMode>
);' >src/main.jsx

# modifying router.jsx file
echo '
import App from "./App"
import ErrorPage from "./pages/errors/ErrorPage"

import {
  createBrowserRouter,
} from "react-router-dom";

const router = createBrowserRouter([
  {
    path: "/",
    element: <App/>,
    errorElement:<ErrorPage/>
  },
]);
export default router;' >src/router.jsx

mkdir src/pages
mkdir src/pages/errors
echo '
import { useRouteError } from "react-router-dom";

export default function ErrorPage() {
  const error = useRouteError();
  console.error(error);

  return (
    <div id="error-page">
      <h1>Oops!</h1>
      <p>Sorry, an unexpected error has occurred.</p>
      <p>
        <i>{error.statusText || error.message}</i>
      </p>
    </div>
  );
};' >src/pages/errors/ErrorPage.jsx
