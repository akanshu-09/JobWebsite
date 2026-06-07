<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="org.project.jobwebsite.model.JobPost" %>
<%@ page isELIgnored="false" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Role Posted — SpaceX Careers</title>
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

        .success-section {
            position: relative;
            z-index: 1;
            padding: 3rem 1rem 1.5rem;
            text-align: center;
        }
        .success-icon {
            font-size: 40px;
            color: #4ade80;
            margin-bottom: 1rem;
            display: block;
        }
        .success-tag {
            font-family: 'Orbitron', monospace;
            font-size: 10px;
            letter-spacing: 4px;
            color: #4ade80;
            text-transform: uppercase;
            display: block;
            margin-bottom: 0.75rem;
        }
        .success-title {
            font-family: 'Orbitron', monospace;
            font-size: clamp(20px, 3vw, 32px);
            font-weight: 700;
            color: #fff;
            margin-bottom: 0.5rem;
        }
        .success-sub {
            font-size: 14px;
            color: rgba(255,255,255,0.35);
            font-weight: 300;
        }

        .detail-card {
            position: relative;
            z-index: 1;
            background: rgba(255,255,255,0.03);
            border: 1px solid rgba(91, 156, 246, 0.15);
            border-radius: 4px;
            padding: 2rem 2.5rem;
            margin: 2rem auto 1.5rem;
            max-width: 600px;
        }
        .detail-card .card-label {
            font-family: 'Orbitron', monospace;
            font-size: 9px;
            letter-spacing: 3px;
            color: rgba(255,255,255,0.3);
            text-transform: uppercase;
            margin-bottom: 0.25rem;
        }
        .detail-card .card-value {
            font-size: 16px;
            color: #e0e6f0;
            margin-bottom: 1.25rem;
            line-height: 1.5;
        }
        .detail-card .job-title {
            font-family: 'Orbitron', monospace;
            font-size: 18px;
            font-weight: 700;
            color: #fff;
            margin-bottom: 1.5rem;
            padding-bottom: 1rem;
            border-bottom: 1px solid rgba(91, 156, 246, 0.12);
        }
        .tech-badge {
            display: inline-block;
            background: rgba(91, 156, 246, 0.1);
            border: 1px solid rgba(91, 156, 246, 0.25);
            color: #5b9cf6;
            font-size: 11px;
            font-family: 'Orbitron', monospace;
            letter-spacing: 1px;
            padding: 4px 10px;
            border-radius: 2px;
            margin: 3px;
        }
        .actions {
            position: relative;
            z-index: 1;
            display: flex;
            gap: 1rem;
            justify-content: center;
            padding: 0 1rem 4rem;
            flex-wrap: wrap;
            max-width: 600px;
            margin: 0 auto;
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
        }
        .btn-space-primary:hover { background: #7ab3f8; color: #060910; text-decoration: none; }
        .btn-space-outline {
            background: transparent;
            color: #5b9cf6;
            border: 1px solid #5b9cf6;
            padding: 10px 28px;
            font-family: 'Orbitron', monospace;
            font-size: 10px;
            font-weight: 700;
            letter-spacing: 2px;
            text-transform: uppercase;
            border-radius: 2px;
            transition: all 0.2s;
            text-decoration: none;
        }
        .btn-space-outline:hover { background: rgba(91,156,246,0.1); color: #5b9cf6; text-decoration: none; }
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

<%
    JobPost myJobPost = (JobPost) request.getAttribute("jobPost");
%>

<div class="success-section">
    <span class="success-icon">✓</span>
    <span class="success-tag">Transmission Confirmed</span>
    <h1 class="success-title">Role Successfully Posted</h1>
    <p class="success-sub">The position has been added to the SpaceX careers portal</p>
</div>

<div class="container">
    <div class="detail-card">
        <% if (myJobPost != null) { %>
        <div class="job-title"><%= myJobPost.getPostProfile() %></div>

        <div class="card-label">Description</div>
        <div class="card-value"><%= myJobPost.getPostDesc() %></div>

        <div class="card-label">Experience Required</div>
        <div class="card-value"><%= myJobPost.getReqExperience() %> years</div>

        <div class="card-label">Tech Stack</div>
        <div class="card-value">
            <% for (String tech : myJobPost.getPostTechStack()) { %>
            <span class="tech-badge"><%= tech %></span>
            <% } %>
        </div>
        <% } else { %>
        <p style="color: rgba(255,255,255,0.4); font-size: 14px;">Job posted successfully.</p>
        <% } %>
    </div>
</div>

<div class="actions">
    <a href="addjob" class="btn-space-outline">Post Another Role</a>
    <a href="viewalljobs" class="btn-space-primary">View All Jobs</a>
</div>

<div class="footer-bar">
    <span>SpaceX Job Portal</span>
    <span><span class="status-dot"></span>Systems Operational</span>
</div>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
