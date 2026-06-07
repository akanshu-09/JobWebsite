<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>All Jobs — SpaceX Careers</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css2?family=Orbitron:wght@400;600;700&family=Rajdhani:wght@300;400;500&display=swap" rel="stylesheet">
    <style>
        * { margin: 0; padding: 0; box-sizing: border-box; }
        body {
            background-color: #060910;
            color: #e0e6f0;
            font-family: 'Rajdhani', sans-serif;
            min-height: 100vh;
            overflow-x: hidden;
        }
        body::before {
            content: '';
            position: fixed;
            inset: 0;
            background-image:
                    radial-gradient(1px 1px at 10% 20%, rgba(255,255,255,0.8) 0%, transparent 100%),
                    radial-gradient(1px 1px at 30% 60%, rgba(255,255,255,0.6) 0%, transparent 100%),
                    radial-gradient(1.5px 1.5px at 50% 10%, rgba(255,255,255,0.9) 0%, transparent 100%),
                    radial-gradient(1px 1px at 70% 40%, rgba(255,255,255,0.5) 0%, transparent 100%),
                    radial-gradient(1px 1px at 85% 75%, rgba(255,255,255,0.7) 0%, transparent 100%),
                    radial-gradient(1px 1px at 20% 85%, rgba(255,255,255,0.6) 0%, transparent 100%),
                    radial-gradient(1.5px 1.5px at 60% 90%, rgba(255,255,255,0.8) 0%, transparent 100%),
                    radial-gradient(1px 1px at 90% 30%, rgba(255,255,255,0.7) 0%, transparent 100%);
            pointer-events: none;
            z-index: 0;
        }
        .navbar {
            background: rgba(6, 9, 16, 0.85) !important;
            border-bottom: 1px solid rgba(100, 160, 255, 0.15);
            backdrop-filter: blur(12px);
            padding: 1rem 0;
            position: relative;
            z-index: 10;
        }
        .navbar-brand {
            font-family: 'Orbitron', monospace;
            font-size: 14px !important;
            font-weight: 700;
            color: #fff !important;
            letter-spacing: 3px;
        }
        .navbar-brand span { color: #5b9cf6; }
        .nav-link {
            font-family: 'Rajdhani', sans-serif;
            font-size: 13px !important;
            color: rgba(255,255,255,0.55) !important;
            letter-spacing: 2px;
            text-transform: uppercase;
            transition: color 0.2s;
            padding: 0.5rem 1rem !important;
        }
        .nav-link:hover { color: #5b9cf6 !important; }

        .page-header {
            position: relative;
            z-index: 1;
            padding: 3rem 1rem 1rem;
            text-align: center;
        }
        .page-tag {
            font-family: 'Orbitron', monospace;
            font-size: 10px;
            letter-spacing: 4px;
            color: #5b9cf6;
            text-transform: uppercase;
            display: block;
            margin-bottom: 0.75rem;
        }
        .page-title {
            font-family: 'Orbitron', monospace;
            font-size: clamp(20px, 3vw, 32px);
            font-weight: 700;
            color: #fff;
            margin-bottom: 0.5rem;
        }
        .page-sub {
            font-size: 14px;
            color: rgba(255,255,255,0.35);
            font-weight: 300;
        }

        .jobs-grid {
            position: relative;
            z-index: 1;
            padding: 2rem 0 4rem;
        }

        .job-card {
            background: rgba(255,255,255,0.03);
            border: 1px solid rgba(91, 156, 246, 0.12);
            border-radius: 4px;
            padding: 1.75rem;
            height: 100%;
            transition: all 0.3s ease;
        }
        .job-card:hover {
            background: rgba(91, 156, 246, 0.06);
            border-color: rgba(91, 156, 246, 0.3);
            transform: translateY(-3px);
        }

        .job-card-header {
            display: flex;
            justify-content: space-between;
            align-items: flex-start;
            margin-bottom: 1rem;
            padding-bottom: 1rem;
            border-bottom: 1px solid rgba(91, 156, 246, 0.1);
        }
        .job-title {
            font-family: 'Orbitron', monospace;
            font-size: 13px;
            font-weight: 700;
            color: #fff;
            line-height: 1.4;
        }
        .exp-badge {
            background: rgba(91, 156, 246, 0.1);
            border: 1px solid rgba(91, 156, 246, 0.2);
            color: #5b9cf6;
            font-family: 'Orbitron', monospace;
            font-size: 9px;
            letter-spacing: 1px;
            padding: 4px 8px;
            border-radius: 2px;
            white-space: nowrap;
            margin-left: 0.75rem;
            flex-shrink: 0;
        }

        .job-field-label {
            font-family: 'Orbitron', monospace;
            font-size: 8px;
            letter-spacing: 3px;
            color: rgba(255,255,255,0.3);
            text-transform: uppercase;
            margin-bottom: 0.3rem;
            margin-top: 0.9rem;
        }
        .job-field-value {
            font-size: 14px;
            color: rgba(255,255,255,0.6);
            line-height: 1.5;
            font-weight: 300;
        }

        .tech-badge {
            display: inline-block;
            background: rgba(91, 156, 246, 0.08);
            border: 1px solid rgba(91, 156, 246, 0.2);
            color: #5b9cf6;
            font-size: 10px;
            font-family: 'Orbitron', monospace;
            letter-spacing: 1px;
            padding: 3px 8px;
            border-radius: 2px;
            margin: 2px;
        }

        /* Empty state */
        .empty-state {
            position: relative;
            z-index: 1;
            text-align: center;
            padding: 5rem 1rem;
        }
        .empty-icon {
            font-size: 48px;
            color: rgba(91, 156, 246, 0.3);
            margin-bottom: 1rem;
            display: block;
        }
        .empty-title {
            font-family: 'Orbitron', monospace;
            font-size: 16px;
            color: rgba(255,255,255,0.4);
            margin-bottom: 0.5rem;
        }
        .empty-sub {
            font-size: 14px;
            color: rgba(255,255,255,0.2);
        }

        .btn-space-primary {
            background: #5b9cf6;
            color: #060910;
            border: none;
            padding: 10px 28px;
            font-family: 'Orbitron', monospace;
            font-size: 10px;
            font-weight: 700;
            letter-spacing: 2px;
            text-transform: uppercase;
            border-radius: 2px;
            transition: all 0.2s;
            text-decoration: none;
            display: inline-block;
            margin-top: 1.5rem;
        }
        .btn-space-primary:hover { background: #7ab3f8; color: #060910; text-decoration: none; }

        .footer-bar {
            position: relative;
            z-index: 1;
            border-top: 1px solid rgba(255,255,255,0.06);
            padding: 1rem 2rem;
            display: flex;
            justify-content: space-between;
            align-items: center;
        }
        .footer-bar span {
            font-size: 11px;
            letter-spacing: 2px;
            color: rgba(255,255,255,0.2);
            text-transform: uppercase;
            font-family: 'Orbitron', monospace;
        }
        .status-dot {
            display: inline-block;
            width: 6px;
            height: 6px;
            border-radius: 50%;
            background: #4ade80;
            margin-right: 6px;
        }
        .job-count {
            font-family: 'Orbitron', monospace;
            font-size: 10px;
            color: rgba(255,255,255,0.25);
            letter-spacing: 2px;
            text-align: center;
            margin-bottom: 1.5rem;
        }
    </style>
</head>
<body>

<nav class="navbar navbar-expand-lg">
    <div class="container">
        <a class="navbar-brand" href="home">⬡ <span>SPACE</span>X CAREERS</a>
        <button class="navbar-toggler" type="button" data-bs-toggle="collapse"
                data-bs-target="#navbarNav" style="border-color: rgba(91,156,246,0.3);">
            <span class="navbar-toggler-icon" style="filter: invert(1);"></span>
        </button>
        <div class="collapse navbar-collapse" id="navbarNav">
            <ul class="navbar-nav ms-auto">
                <li class="nav-item"><a class="nav-link" href="home">Home</a></li>
                <li class="nav-item"><a class="nav-link" href="viewalljobs">All Jobs</a></li>
                <li class="nav-item"><a class="nav-link" href="addjob">Post a Job</a></li>
                <li class="nav-item"><a class="nav-link" href="https://www.spacex.com/">SpaceX.com</a></li>
            </ul>
        </div>
    </div>
</nav>

<div class="page-header">
    <span class="page-tag">Open Positions</span>
    <h1 class="page-title">All Jobs</h1>
    <p class="page-sub">Current mission-critical roles at SpaceX</p>
</div>

<div class="jobs-grid">
    <div class="container">
        <div class="container mb-4" style="position: relative; z-index: 1;">
            <form action="/viewalljobs" method="get" style="display: flex; gap: 0.75rem; max-width: 500px; margin: 0 auto;">
                <input type="text" name="keyword" value="${param.keyword}"
                       placeholder="Search by role title..."
                       style="flex: 1; background: rgba(255,255,255,0.04); border: 1px solid rgba(91,156,246,0.2);
                      border-radius: 2px; padding: 10px 16px; color: #e0e6f0;
                      font-family: 'Rajdhani', sans-serif; font-size: 14px;">
                <button type="submit"
                        style="background: #5b9cf6; color: #060910; border: none; padding: 10px 20px;
                       font-family: 'Orbitron', monospace; font-size: 9px; font-weight: 700;
                       letter-spacing: 2px; border-radius: 2px; cursor: pointer;">
                    Search
                </button>
            </form>
        </div>
        <c:choose>
            <c:when test="${empty jobPosts}">
                <div class="empty-state">
                    <span class="empty-icon">◎</span>
                    <div class="empty-title">No Roles Found</div>
                    <p class="empty-sub">No positions have been posted yet.</p>
                    <a href="addjob" class="btn-space-primary">Post First Role</a>
                </div>
            </c:when>
            <c:otherwise>
                <div class="job-count">${jobPosts.size()} OPEN POSITION(S)</div>
                <div class="row row-cols-1 row-cols-md-2 g-4">
                    <c:forEach var="jobPost" items="${jobPosts}">
                        <div class="col">
                            <div class="job-card">
                                <div class="job-card-header">
                                    <div class="job-title">${jobPost.postProfile}</div>
                                    <span class="exp-badge">${jobPost.reqExperience} YRS</span>
                                </div>

                                <div class="job-field-label">Description</div>
                                <div class="job-field-value">${jobPost.postDesc}</div>

                                <div class="job-field-label">Tech Stack</div>
                                <div style="margin-top: 0.4rem;">
                                    <c:forEach var="tech" items="${jobPost.postTechStack}">
                                        <span class="tech-badge">${tech}</span>
                                    </c:forEach>
                                </div>
                                <div style="margin-top: 1.25rem; padding-top: 1rem; border-top: 1px solid rgba(91,156,246,0.1);">
                                    <a href="/deletejob/${jobPost.postId}"
                                       style="font-family: 'Orbitron', monospace; font-size: 10px; letter-spacing: 2px;
                          color: rgba(255,80,80,0.6); text-decoration: none; text-transform: uppercase;"
                                       onclick="return confirm('Remove this role from the portal?')">
                                        Remove Role
                                    </a>
                                </div>
                            </div>
                        </div>
                    </c:forEach>
                </div>
            </c:otherwise>
        </c:choose>

    </div>
</div>

<div class="footer-bar">
    <span>SpaceX Job Portal</span>
    <span><span class="status-dot"></span>Systems Operational</span>
</div>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
