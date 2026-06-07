<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>SpaceX Job Portal</title>
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

        /* Star field */
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
                    radial-gradient(1px 1px at 40% 50%, rgba(255,255,255,0.4) 0%, transparent 100%),
                    radial-gradient(1px 1px at 90% 30%, rgba(255,255,255,0.7) 0%, transparent 100%),
                    radial-gradient(1px 1px at 15% 45%, rgba(255,255,255,0.5) 0%, transparent 100%),
                    radial-gradient(1px 1px at 75% 15%, rgba(255,255,255,0.6) 0%, transparent 100%),
                    radial-gradient(1.5px 1.5px at 55% 70%, rgba(255,255,255,0.5) 0%, transparent 100%);
            pointer-events: none;
            z-index: 0;
        }

        /* Navbar */
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
            text-transform: uppercase;
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

        /* Hero */
        .hero {
            position: relative;
            z-index: 1;
            min-height: 75vh;
            display: flex;
            align-items: center;
            justify-content: center;
            text-align: center;
            padding: 4rem 1rem;
        }

        .hero::before {
            content: '';
            position: absolute;
            top: 50%;
            left: 50%;
            transform: translate(-50%, -50%);
            width: 600px;
            height: 600px;
            background: radial-gradient(circle, rgba(91, 156, 246, 0.06) 0%, transparent 70%);
            pointer-events: none;
        }

        .hero-tag {
            font-family: 'Orbitron', monospace;
            font-size: 10px;
            letter-spacing: 4px;
            color: #5b9cf6;
            text-transform: uppercase;
            margin-bottom: 1.5rem;
            display: block;
        }

        .hero-title {
            font-family: 'Orbitron', monospace;
            font-size: clamp(28px, 5vw, 52px);
            font-weight: 700;
            color: #fff;
            line-height: 1.2;
            margin-bottom: 1.5rem;
        }

        .hero-title .accent { color: #5b9cf6; }

        .hero-sub {
            font-size: 16px;
            color: rgba(255,255,255,0.4);
            max-width: 480px;
            margin: 0 auto 3rem;
            line-height: 1.7;
            font-weight: 300;
            letter-spacing: 0.5px;
        }

        /* Cards */
        .portal-cards {
            position: relative;
            z-index: 1;
            padding: 0 1rem 5rem;
        }

        .portal-card {
            background: rgba(255,255,255,0.03);
            border: 1px solid rgba(91, 156, 246, 0.12);
            border-radius: 4px;
            padding: 2.5rem 2rem;
            text-align: center;
            transition: all 0.3s ease;
            text-decoration: none;
            display: block;
            color: inherit;
        }

        .portal-card:hover {
            background: rgba(91, 156, 246, 0.07);
            border-color: rgba(91, 156, 246, 0.35);
            transform: translateY(-4px);
            color: inherit;
            text-decoration: none;
        }

        .card-icon {
            font-size: 36px;
            color: #5b9cf6;
            margin-bottom: 1.25rem;
            display: block;
        }

        .card-title-text {
            font-family: 'Orbitron', monospace;
            font-size: 11px;
            font-weight: 700;
            color: #fff;
            letter-spacing: 3px;
            text-transform: uppercase;
            margin-bottom: 0.75rem;
        }

        .card-desc {
            font-size: 14px;
            color: rgba(255,255,255,0.4);
            line-height: 1.6;
            margin-bottom: 1.75rem;
            font-weight: 300;
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
        }

        .btn-space-primary:hover {
            background: #7ab3f8;
            color: #060910;
            text-decoration: none;
        }

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
            display: inline-block;
        }

        .btn-space-outline:hover {
            background: rgba(91, 156, 246, 0.1);
            color: #5b9cf6;
            text-decoration: none;
        }

        /* Footer bar */
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

        /* Divider line */
        .section-divider {
            border: none;
            border-top: 1px solid rgba(91, 156, 246, 0.1);
            margin: 0 2rem;
            position: relative;
            z-index: 1;
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

<section class="hero">
    <div>
        <span class="hero-tag">Mission: Find Your Role</span>
        <h1 class="hero-title">
            Build the Future<br>of <span class="accent">Space Travel</span>
        </h1>
        <p class="hero-sub">
            Join the team making humanity multiplanetary. Explore open positions across
            engineering, propulsion, software, and operations.
        </p>
    </div>
</section>

<hr class="section-divider">

<div class="portal-cards">
    <div class="container">
        <div class="row g-4 justify-content-center mt-2">
            <div class="col-md-5">
                <a href="viewalljobs" class="portal-card">
                    <span class="card-icon">◈</span>
                    <div class="card-title-text">View All Jobs</div>
                    <p class="card-desc">Browse all open mission-critical positions across every SpaceX division.</p>
                    <span class="btn-space-primary">Explore Roles</span>
                </a>
            </div>
            <div class="col-md-5">
                <a href="addjob" class="portal-card">
                    <span class="card-icon">✦</span>
                    <div class="card-title-text">Post a Job</div>
                    <p class="card-desc">Add a new position to the SpaceX careers portal for mission-critical hiring.</p>
                    <span class="btn-space-outline">Add Listing</span>
                </a>
            </div>
        </div>
    </div>
</div>

<div class="footer-bar">
    <span>SpaceX Job Portal</span>
    <span><span class="status-dot"></span>Systems Operational</span>
</div>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>