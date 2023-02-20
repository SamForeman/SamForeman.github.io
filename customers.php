<!DOCTYPE html>
<html>
<head>
	<title>Navigation Bar with Dropdown Columns</title>
	<style>
		/* Style for the navigation bar */
		nav {
			background-color: #333;
			overflow: hidden;
		}

		nav a {
			float: left;
			color: white;
			text-align: center;
			padding: 14px 16px;
			text-decoration: none;
		}

		nav a:hover {
			background-color: #ddd;
			color: black;
		}

		nav .dropdown {
			float: left;
			overflow: hidden;
		}

		nav .dropdown .dropbtn {
			font-size: 16px;
			border: none;
			outline: none;
			color: white;
			padding: 14px 16px;
			background-color: inherit;
			font-family: inherit;
			margin: 0;
		}

		nav .dropdown-content {
			display: none;
			position: absolute;
			background-color: #f9f9f9;
			min-width: 160px;
			box-shadow: 0px 8px 16px 0px rgba(0,0,0,0.2);
			z-index: 1;
		}

		nav .dropdown-content a {
			float: none;
			color: black;
			padding: 12px 16px;
			text-decoration: none;
			display: block;
			text-align: left;
		}

		nav .dropdown:hover .dropdown-content {
			display: block;
		}
        .container {
            position: relative;
            width: 200px;
            height: 300px;
            }

            .box {
            position: absolute;
            top: 0;
            left: 0;
            width: 100%;
            height: 200px;
            background-color: #ccc;
            cursor: pointer;
            }

            .box-content {
            position: absolute;
            bottom: 0;
            left: 0;
            right: 0;
            height: 0;
            background-color: #fff;
            overflow: hidden;
            transition: height 0.5s ease;
            }

            .box.active .box-content {
            height: 100px;
            }
	</style>
</head>
<body>

	<!-- The navigation bar -->
	<nav>
		<a href="#">Home</a>
		<a href="#">About</a>
		<div class="dropdown">
			<button class="dropbtn">Services</button>
			<div class="dropdown-content">
				<a href="#">Service 1</a>
				<a href="#">Service 2</a>
				<a href="#">Service 3</a>
			</div>
		</div>
		<div class="dropdown">
			<button class="dropbtn">Products</button>
			<div class="dropdown-content">
				<a href="#">Product 1</a>
				<a href="#">Product 2</a>
				<a href="#">Product 3</a>
			</div>
		</div>
		<a href="#">Contact</a>
	</nav>
    <div class="container">
    <div class="box">
        <div class="box-content">
        <h2>Click me</h2>
        <p>Some text that will be revealed</p>
        </div>
    </div>
    <p>Some text underneath the box</p>
    </div>
    </div>
    <script>
        document.addEventListener("DOMContentLoaded", function() {
        var box = document.querySelector(".box");
        box.addEventListener("click", function() {
        this.classList.toggle("active");
        });
    });
    </script>
</body>
</html>