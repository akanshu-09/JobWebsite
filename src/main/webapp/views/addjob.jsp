<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Post a Job — SpaceX Careers</title>
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
                    radial-gradient(1px 1px at 90% 30%, rgba(255,255,255,0.7) 0%, transparent 100%),
                    radial-gradient(1px 1px at 15% 45%, rgba(255,255,255,0.5) 0%, transparent 100%),
                    radial-gradient(1px 1px at 75% 15%, rgba(255,255,255,0.6) 0%, transparent 100%);
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

        /* Page header */
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
            letter-spacing: 0.5px;
        }

        /* Form card */
        .form-card {
            position: relative;
            z-index: 1;
            background: rgba(255,255,255,0.03);
            border: 1px solid rgba(91, 156, 246, 0.15);
            border-radius: 4px;
            padding: 2.5rem;
            margin: 2rem auto 4rem;
            max-width: 640px;
        }

        .form-label {
            font-family: 'Orbitron', monospace;
            font-size: 9px;
            letter-spacing: 3px;
            text-transform: uppercase;
            color: rgba(255,255,255,0.45);
            margin-bottom: 0.4rem;
            display: block;
        }

        .form-control, .form-select {
            background: rgba(255,255,255,0.04) !important;
            border: 1px solid rgba(91, 156, 246, 0.18) !important;
            border-radius: 2px !important;
            color: #e0e6f0 !important;
            font-family: 'Rajdhani', sans-serif;
            font-size: 15px;
            padding: 0.65rem 1rem;
            transition: border-color 0.2s, background 0.2s;
        }

        .form-control:focus, .form-select:focus {
            background: rgba(91, 156, 246, 0.06) !important;
            border-color: rgba(91, 156, 246, 0.5) !important;
            box-shadow: none !important;
            color: #fff !important;
            outline: none;
        }

        .form-control::placeholder {
            color: rgba(255,255,255,0.2);
        }

        /* Select options */
        .form-select option {
            background: #0e1525;
            color: #e0e6f0;
        }

        /* Textarea */
        textarea.form-control { resize: vertical; min-height: 90px; }

        /* Select hint */
        .select-hint {
            font-size: 11px;
            color: rgba(255,255,255,0.25);
            margin-top: 0.35rem;
            letter-spacing: 0.5px;
        }

        /* Field divider */
        .field-group { margin-bottom: 1.5rem; }

        /* Submit button */
        .btn-submit {
            width: 100%;
            background: #5b9cf6;
            color: #060910;
            border: none;
            padding: 14px;
            font-family: 'Orbitron', monospace;
            font-size: 11px;
            font-weight: 700;
            letter-spacing: 3px;
            text-transform: uppercase;
            border-radius: 2px;
            transition: all 0.2s;
            margin-top: 0.5rem;
            cursor: pointer;
        }

        .btn-submit:hover { background: #7ab3f8; }

        /* Form divider */
        .form-divider {
            border: none;
            border-top: 1px solid rgba(91, 156, 246, 0.1);
            margin: 2rem 0;
        }

        .form-section-label {
            font-family: 'Orbitron', monospace;
            font-size: 9px;
            letter-spacing: 3px;
            color: #5b9cf6;
            text-transform: uppercase;
            margin-bottom: 1.25rem;
        }

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

<div class="page-header">
    <span class="page-tag">New Mission Role</span>
    <h1 class="page-title">Post a Job</h1>
    <p class="page-sub">Add a new position to the SpaceX careers portal</p>
</div>

<div class="container">
    <div class="form-card">

        <p class="form-section-label">Role Information</p>

        <form action="handleForm" method="post">

            <div class="field-group">
                <label for="postProfile" class="form-label">Job Title / Profile</label>
                <input type="text" class="form-control" id="postProfile"
                       name="postProfile" placeholder="e.g. Propulsion Engineer" required>
            </div>

            <div class="field-group">
                <label for="postDesc" class="form-label">Role Description</label>
                <textarea class="form-control" id="postDesc" name="postDesc"
                          placeholder="Describe the mission, responsibilities, and expectations..." required></textarea>
            </div>

            <div class="field-group">
                <label for="reqExperience" class="form-label">Required Experience (years)</label>
                <input type="number" class="form-control" id="reqExperience"
                       name="reqExperience" placeholder="e.g. 3" min="0" max="30" required>
            </div>

            <hr class="form-divider">
            <p class="form-section-label">Technical Requirements</p>

            <div class="field-group">
                <label for="postTechStack" class="form-label">Tech Stack</label>
                <select multiple class="form-select" id="postTechStack" name="postTechStack"
                        style="height: 180px;" required>
                    <option value="Java">Java</option>
                    <option value="Python">Python</option>
                    <option value="C++">C++</option>
                    <option value="Rust">Rust</option>
                    <option value="Go">Go</option>
                    <option value="JavaScript">JavaScript</option>
                    <option value="TypeScript">TypeScript</option>
                    <option value="Swift">Swift</option>
                    <option value="Kotlin">Kotlin</option>
                    <option value="PHP">PHP</option>
                    <option value="HTML5">HTML5</option>
                    <option value="CSS3">CSS3</option>
                    <option value="React">React</option>
                    <option value="Vue.js">Vue.js</option>
                    <option value="Angular">Angular</option>
                    <option value="Node.js">Node.js</option>
                    <option value="Express.js">Express.js</option>
                    <option value="Spring Boot">Spring Boot</option>
                    <option value="Django">Django</option>
                    <option value="Flask">Flask</option>
                    <option value="React Native">React Native</option>
                    <option value="Flutter">Flutter</option>
                    <option value="Ruby on Rails">Ruby on Rails</option>
                    <option value="Laravel">Laravel</option>
                    <option value="TensorFlow">TensorFlow</option>
                    <option value="PyTorch">PyTorch</option>
                    <option value="Machine Learning">Machine Learning</option>
                    <option value="Artificial Intelligence">Artificial Intelligence</option>
                    <option value="Kubernetes">Kubernetes</option>
                    <option value="Docker">Docker</option>
                    <option value="Jenkins">Jenkins</option>
                    <option value="DevOps">DevOps</option>
                    <option value="AWS">AWS</option>
                    <option value="Azure">Azure</option>
                    <option value="Google Cloud">Google Cloud</option>
                    <option value="GraphQL">GraphQL</option>
                    <option value="Apache Kafka">Apache Kafka</option>
                    <option value="Elasticsearch">Elasticsearch</option>
                    <option value="Blockchain">Blockchain</option>
                    <option value="Cybersecurity">Cybersecurity</option>
                    <option value="Scrum">Scrum</option>
                    <option value="Agile">Agile</option>
                    <option value="Embedded Systems">Embedded Systems</option>
                    <option value="RTOS">RTOS</option>
                    <option value="MATLAB">MATLAB</option>
                    <option value="ROS">ROS (Robot Operating System)</option>
                </select>
                <p class="select-hint">Hold Ctrl (Windows) or Cmd (Mac) to select multiple</p>
            </div>

            <button type="submit" class="btn-submit">Submit Role ›</button>

        </form>
    </div>
</div>

<div class="footer-bar">
    <span>SpaceX Job Portal</span>
    <span><span class="status-dot"></span>Systems Operational</span>
</div>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>

