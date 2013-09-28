<!DOCTYPE html>
<html>
<head>
<meta name="layout" content="main" />
<title>Library</title>
</head>
<body>

        <div class="nav" role="navigation">
            <ul>
                <li><g:link controller="book" action="add">
                    New book
                </g:link></li>
            </ul>
        </div>


    <g:if test="${flash.message}">
        <div class="message">
            ${flash.message}
        </div>
    </g:if>

    <g:form action="take" method="post">
        <table class="table">
            <thead>
                <tr>
                    <th>Title</th>
                    <th>Release year</th>
                    <th>Owner</th>
                </tr>
            </thead>
            <tbody>
                <g:each in="${books}">
                    <tr>
                        <td>
                          <g:link action="show" id="${it.id }" controller="book">${it.name }</g:link>   
                        </td>
                        <td>
                            <g:link action="show" id="${it.id }" controller="book">${it.yearOfRelease.format('yyyy-MM-dd') }</g:link>
                        </td>
                       <td>
                          <g:link action="show" id="${it.id }" controller="user">${it?.user?.name }</g:link>   
                        </td>
                    </tr>
                </g:each>
            </tbody>
        </table>
    </g:form>
</body>
</html>
