<%--
  Created by IntelliJ IDEA.
  User: kirte
  Date: 03-01-2024
  Time: 15:27
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html lang="en" class="h-full">

<head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <link href="${pageContext.request.contextPath}/path/to/tailwind.css" rel="stylesheet">

    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Title</title>
    <link href="https://unpkg.com/tailwindcss@^2/dist/tailwind.min.css" rel="stylesheet">
</head>
<body>





<!--
  This example requires updating your template:

  ```
  <html class="h-full">
  <body class="h-full">
  ```
-->
<main class="grid min-h-full place-items-center bg-white px-6 py-24 sm:py-32 lg:px-8">
    <div class="text-center">
        <p class="text-base font-semibold text-indigo-600">404</p>
        <h1 class="mt-4 text-3xl font-bold tracking-tight text-gray-900 sm:text-5xl">Page not found</h1>
        <p class="mt-6 text-base leading-7 text-gray-600">Sorry, we couldn’t find the page you’re looking for.</p>
        <div class="mt-10 flex items-center justify-center gap-x-6">
            <a href="index.jsp" class="rounded-md bg-indigo-600 px-3.5 py-2.5 text-sm font-semibold text-white shadow-sm hover:bg-indigo-500 focus-visible:outline focus-visible:outline-2 focus-visible:outline-offset-2 focus-visible:outline-indigo-600">Go back home</a>
            <a href="#" class="text-sm font-semibold text-gray-900">Contact support <span aria-hidden="true">&rarr;</span></a>
        </div>
    </div>
</main>


</body>
</html>
