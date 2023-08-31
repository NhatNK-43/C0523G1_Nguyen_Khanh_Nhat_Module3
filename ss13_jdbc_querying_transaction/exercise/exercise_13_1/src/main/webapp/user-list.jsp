<%--
  Created by IntelliJ IDEA.
  User: Khanh Nhat
  Date: 30/08/2023
  Time: 5:09 CH
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>Home</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
    <style>
        body {
            margin: 0 50px;
        }

        tbody tr:nth-child(odd) {
            background: gainsboro;
        }

        table {
            border: 1px solid gainsboro;
            width: 100%;
        }

        th, td {
            width: 16.67%;
            height: 60px;
            padding-left: 10px;
            border-collapse: collapse;
        }

        .form-control {
            width: 50%;
        }

        .collapse {
            justify-content: flex-end;
        }
    </style>
</head>
<body>
<table>
    <nav class="navbar navbar-expand-lg bg-light">
        <div class="container-fluid">
            <a class="navbar-brand tw-semibold" href="/user">User list</a>
            <div class="collapse navbar-collapse" id="navbarSupportedContent">
                <form action="/user?action=searchByCountry" method="post" class="d-flex" role="search">
                    <input class="form-control me-2" type="search" placeholder="Search" aria-label="Search"
                           name="countrySearch" id="countrySearch" oninput="inputSearch()" value="${countrySearch}">
                    <button class="btn btn-outline-success me-2" type="submit" id="searchCountry">Search</button>
                </form>
                <a class="btn btn-primary me-2" role="button" href="/user?action=showListSort">Sort</a>
                <a class="btn btn-primary" role="button" href="/user?action=showFormCreate">Add</a>
            </div>
        </div>
    </nav>
    <thead>
    <tr>
        <th>Ordinal number</th>
        <th>Name</th>
        <th>Email</th>
        <th>Country</th>
    </tr>
    </thead>
    <tbody>
    <c:forEach var="user" items="${userList}" varStatus="ordinalNumber">
        <tr>
            <td><c:out value="${ordinalNumber.count}"/></td>
            <td><c:out value="${user.name}"/></td>
            <td><c:out value="${user.email}"/></td>
            <td><c:out value="${user.country}"/></td>
            <td><a class="btn btn-outline-primary" role="button"
                   href="/user?action=showFormUpdate&id=${user.id}">Edit</a></td>
            <td>
                <button type="button" class="btn btn-outline-danger" data-bs-toggle="modal"
                        data-bs-target="#deleteModal"
                        onclick="sendInformToModalDelete('${user.id}','${user.name}')">Delete
                </button>
            </td>
        </tr>
    </c:forEach>
    </tbody>
</table>

<div id="deleteModal" class="modal" tabindex="-1">
    <div class="modal-dialog">
        <div class="modal-content">
            <form action="/user?action=delete" method="post">
                <div class="modal-header">
                    <h5 class="modal-title">Delete user</h5>
                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                </div>
                <div class="modal-body">
                    <p>Do you want to delete user <span id="nameDelete" class="text-danger"></span></p>
                    <input type="hidden" id="idDelete" name="idDelete">
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-outline-secondary" data-bs-dismiss="modal">Cancel</button>
                    <button type="submit" class="btn btn-outline-danger">Delete</button>
                </div>
            </form>
        </div>
    </div>
</div>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4" crossorigin="anonymous">
</script>
<script>
    function sendInformToModalDelete(id, nameDelete) {
        document.getElementById("nameDelete").textContent = nameDelete;
        document.getElementById("idDelete").value = id;
    }

    <%--function inputSearch() {--%>
    <%--    document.getElementById("searchCountry").click();--%>
    <%--}--%>

    <%--window.onload = function () {--%>
    <%--    document.getElementById("countrySearch").focus();--%>
    <%--    document.getElementById("countrySearch").value = '${countrySearch}';--%>
    <%--}--%>
</script>
</body>
</html>
