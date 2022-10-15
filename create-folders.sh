#!/usr/bin/bash

folders=(src/{'features'/{'api'/apiSlice.js,'auth'/{authSlice.js,authSelector.js}},'app'/store.js,router.jsx,'pages'/{'errors'/ErrorPage.jsx,'home'/home.jsx}} .env)

#creating folder structure for redux
for i in "${folders[@]}"; do install -D /dev/null "$i"; done
