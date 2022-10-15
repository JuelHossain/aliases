#! /usr/bin/bash

# installiing redux toolkit
npm install @reduxjs/toolkit
npm install react-redux



echo '
import { configureStore } from "@reduxjs/toolkit";
import { apiSlice } from "../features/api/apiSlice";
import authSliceReducer from "../features/auth/authSlice";

export const store = configureStore({
  reducer: {
    [apiSlice.reducerPath]: apiSlice.reducer,
    auth: authSliceReducer,
  },
  devTools: import.meta.env.DEV,
  middleware: (getDefaultMiddlewares) =>
    getDefaultMiddlewares().concat(apiSlice.middleware),
});
' >src/app/store.js

echo 'import { createApi, fetchBaseQuery } from "@reduxjs/toolkit/query/react";
import { userLoggedOut } from "../auth/authSlice";

const baseQuery = fetchBaseQuery({
  baseUrl: import.meta.env.API_URL,
  prepareHeaders: async (headers, { getState, endpoint }) => {
    const token = getState()?.auth?.accessToken;
    if (token) {
      headers.set("Authorization", `Bearer ${token}`);
    }
    headers.set("mode", "no-cors");
    return headers;
  },
});

export const apiSlice = createApi({
  reducerPath: "api",
  baseQuery: async (args, api, extraOptions) => {
    let result = await baseQuery(args, api, extraOptions);

    if (result?.error?.status === 401) {
      api.dispatch(userLoggedOut());
      localStorage.clear();
    }
    return result;
  },
  tagTypes: [],
  endpoints: (builder) => ({}),
});' >src/features/api/apislice.js

echo '
import { createSlice } from "@reduxjs/toolkit";

const initialState = {
  accessToken: "",
  user: {},
};

const authSlice = createSlice({
  name: "auth",
  initialState,
  reducers: {
    userLoggedIn: (state, action) => {
      state.accessToken = action.payload.accessToken;
      state.user = action.payload.user;
    },
    userLoggedOut: (state) => {
      localStorage.clear();
      state.accessToken = undefined;
      state.user = undefined;
    },
  },
});

export const { userLoggedIn, userLoggedOut } = authSlice.actions;
export default authSlice.reducer;

' >src/features/auth/authSlice.js

echo 'export const selectUser = (state) => state.auth.user;
' >src/features/auth/authSelector.js

echo ' API_URL=http://localhost/5000' >.env
