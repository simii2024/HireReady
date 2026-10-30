<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Administrator Sign In - HireReady</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/style.css">
</head>
<body>

    <jsp:include page="/WEB-INF/views/common/navbar.jsp" />

    <main class="main-content">
        <div class="container">
            <div class="auth-wrapper">
                <div class="auth-card">
                    <div class="auth-header">
                        <span class="badge badge-primary" style="margin-bottom: 0.5rem;">Administration</span>
                        <h1>Admin Sign In</h1>
                        <p>Authenticate with administrator credentials</p>
                    </div>

                    <jsp:include page="/WEB-INF/views/common/alerts.jsp" />

                    <form action="${pageContext.request.contextPath}/admin/login" method="POST">
                        <div class="form-group">
                            <label for="username" class="form-label">Admin Username <span class="required">*</span></label>
                            <input type="text" id="username" name="username" class="form-control" 
                                   value="<c:out value='${username}' />" placeholder="e.g. admin" required autofocus>
                        </div>

                        <div class="form-group">
                            <label for="password" class="form-label">Password <span class="required">*</span></label>
                            <input type="password" id="password" name="password" class="form-control" 
                                   placeholder="Enter administrator password" required>
                        </div>

                        <button type="submit" class="btn btn-primary btn-lg" style="width: 100%; margin-top: 0.5rem;">
                            Sign In to Admin Console
                        </button>
                    </form>

                    <div style="background-color: #f8fafc; border: 1px dashed var(--border); border-radius: var(--radius-md); padding: 0.85rem; margin-top: 1.5rem; font-size: 0.82rem; color: var(--text-muted);">
                        <strong>Default Testing Credentials:</strong><br>
                        Username: <code>admin</code><br>
                        Password: <code>Admin@123</code>
                    </div>

                    <div style="text-align: center; margin-top: 1.25rem; font-size: 0.9rem;">
                        <a href="${pageContext.request.contextPath}/login">&larr; Return to User Login</a>
                    </div>
                </div>
            </div>
        </div>
    </main>

    <jsp:include page="/WEB-INF/views/common/footer.jsp" />

</body>
</html>
