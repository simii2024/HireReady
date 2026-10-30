<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Administrator Dashboard - HireReady</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/style.css">
</head>
<body>

    <jsp:include page="/WEB-INF/views/common/navbar.jsp" />

    <main class="main-content">
        <div class="container">
            <jsp:include page="/WEB-INF/views/common/alerts.jsp" />

            <div style="display: flex; justify-content: space-between; align-items: center; flex-wrap: wrap; gap: 1rem; margin-bottom: 2rem;">
                <div>
                    <span class="badge badge-primary" style="margin-bottom: 0.35rem;">Control Panel</span>
                    <h1>Administrator Dashboard</h1>
                    <p style="color: var(--text-muted); margin-bottom: 0;">
                        System overview, user administration, and resume moderation console.
                    </p>
                </div>
                <div>
                    <a href="${pageContext.request.contextPath}/filter" class="btn btn-secondary">
                        Search &amp; Filter Resumes
                    </a>
                </div>
            </div>

            <!-- Stats Grid -->
            <div class="stats-grid">
                <div class="stat-card">
                    <div class="stat-num"><c:out value="${userCount}" default="0" /></div>
                    <div class="stat-label">Total Registered Users</div>
                </div>
                <div class="stat-card">
                    <div class="stat-num"><c:out value="${resumeCount}" default="0" /></div>
                    <div class="stat-label">Total Resumes in System</div>
                </div>
                <div class="stat-card">
                    <div class="stat-num" style="font-size: 1.3rem; line-height: 1.5; color: var(--text-main); font-weight: 600;">
                        <c:out value="${sessionScope.adminName}" />
                    </div>
                    <div class="stat-label">Active Admin Session</div>
                </div>
            </div>

            <!-- Resume Moderation Table -->
            <div class="card">
                <div class="card-header">
                    <h2>All Stored Resumes</h2>
                    <span class="badge badge-primary"><c:out value="${resumeCount}" default="0" /> Records</span>
                </div>
                <div class="card-body" style="padding: 0;">
                    <c:choose>
                        <c:when test="${not empty resumes}">
                            <div class="table-responsive">
                                <table class="table">
                                    <thead>
                                        <tr>
                                            <th>ID</th>
                                            <th>Resume Title</th>
                                            <th>Candidate</th>
                                            <th>Contact Email</th>
                                            <th>Last Modified</th>
                                            <th style="text-align: right;">Moderation Actions</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <c:forEach var="res" items="${resumes}">
                                            <tr>
                                                <td>#<c:out value="${res.resumeId}" /></td>
                                                <td>
                                                    <strong>
                                                        <a href="${pageContext.request.contextPath}/resume/view?id=${res.resumeId}">
                                                            <c:out value="${res.title}" />
                                                        </a>
                                                    </strong>
                                                </td>
                                                <td><c:out value="${res.fullName}" /></td>
                                                <td><c:out value="${res.email}" /></td>
                                                <td>
                                                    <span style="font-size: 0.85rem; color: var(--text-muted);">
                                                        <c:out value="${res.updatedAt}" />
                                                    </span>
                                                </td>
                                                <td style="text-align: right; white-space: nowrap;">
                                                    <a href="${pageContext.request.contextPath}/resume/view?id=${res.resumeId}" 
                                                       class="btn btn-secondary btn-sm" target="_blank">
                                                        Inspect
                                                    </a>
                                                    <a href="${pageContext.request.contextPath}/admin/resume/delete?id=${res.resumeId}" 
                                                       class="btn btn-danger btn-sm"
                                                       onclick="return confirmAction('Admin Action: Permanently delete resume #' + ${res.resumeId} + '?');">
                                                        Delete
                                                    </a>
                                                </td>
                                            </tr>
                                        </c:forEach>
                                    </tbody>
                                </table>
                            </div>
                        </c:when>
                        <c:otherwise>
                            <div style="text-align: center; padding: 2.5rem 1rem; color: var(--text-muted);">
                                No resumes available in the database.
                            </div>
                        </c:otherwise>
                    </c:choose>
                </div>
            </div>

            <!-- Registered Users Table -->
            <div class="card">
                <div class="card-header">
                    <h2>Registered Users</h2>
                    <span class="badge badge-neutral"><c:out value="${userCount}" default="0" /> Users</span>
                </div>
                <div class="card-body" style="padding: 0;">
                    <c:choose>
                        <c:when test="${not empty users}">
                            <div class="table-responsive">
                                <table class="table">
                                    <thead>
                                        <tr>
                                            <th>User ID</th>
                                            <th>Full Name</th>
                                            <th>Email Address</th>
                                            <th>Registration Date</th>
                                            <th style="text-align: right;">Action</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <c:forEach var="u" items="${users}">
                                            <tr>
                                                <td>#<c:out value="${u.userId}" /></td>
                                                <td><strong><c:out value="${u.fullName}" /></strong></td>
                                                <td><c:out value="${u.email}" /></td>
                                                <td>
                                                    <span style="font-size: 0.85rem; color: var(--text-muted);">
                                                        <c:out value="${u.createdAt}" />
                                                    </span>
                                                </td>
                                                <td style="text-align: right; white-space: nowrap;">
                                                    <a href="${pageContext.request.contextPath}/admin/user/delete?id=${u.userId}" 
                                                       class="btn btn-danger btn-sm"
                                                       onclick="return confirmAction('WARNING: Deleting this user will also delete all their resumes. Proceed?');">
                                                        Delete User
                                                    </a>
                                                </td>
                                            </tr>
                                        </c:forEach>
                                    </tbody>
                                </table>
                            </div>
                        </c:when>
                        <c:otherwise>
                            <div style="text-align: center; padding: 2.5rem 1rem; color: var(--text-muted);">
                                No users registered yet.
                            </div>
                        </c:otherwise>
                    </c:choose>
                </div>
            </div>

        </div>
    </main>

    <jsp:include page="/WEB-INF/views/common/footer.jsp" />

</body>
</html>
