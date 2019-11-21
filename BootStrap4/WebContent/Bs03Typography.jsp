<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%-- <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%> --%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Bs03Typography.jsp</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
</head>
<body>
	<div class="container">
		<h2>Typography : 여러가지 텍스트 효과</h2>
		
		<h1>h1 Bootstrap heading (2.5rem = 40px)</h1>
		<h2>h2 Bootstrap heading (2rem = 32px)</h2>
		<h3>h3 Bootstrap heading (1.75rem = 28px)</h3>
		<h4>h4 Bootstrap heading (1.5rem = 24px)</h4>
		<h5>h5 Bootstrap heading (1.25rem = 20px)</h5>
		<h6>h6 Bootstrap heading (1rem = 16px)</h6>
	</div>
	 
	<div class="container">
		<h1>Display Headings</h1>
		<h1 class="display-1">Display 1</h1>
		<h1 class="display-2">Display 2</h1>
		<h1 class="display-3">Display 3</h1>
		<h1 class="display-4">Display 4</h1>
	</div>
	
	<div class="container">
		<h1>Hn태그와 함께 사용하는 small태그</h1>
		<p>heading태그에 small태그를 사용하면 각 태그에 따라 small의 크기가 결정된다.
		부제목 으로 사용 할 수 있다.</p>
		<h1>h1 heading <small>secondary text</small></h1>
		<h2>h2 heading <small>secondary text</small></h2>
		<h3>h3 heading <small>secondary text</small></h3>
		<h4>h4 heading <small>secondary text</small></h4>
		<h5>h5 heading <small>secondary text</small></h5>
		<h6>h6 heading <small>secondary text</small></h6>
	</div>
	
	<div class="container">
		<h1>Blockquotes</h1>
		<p>The blockquote element is used to present content from another source:</p>
		<blockquote class="blockquote">
		  <p>For 50 years, WWF has been protecting the future of nature. The world's leading conservation organization, WWF works in 100 countries and is supported by 1.2 million members in the United States and close to 5 million globally.</p>
		  <footer class="blockquote-footer">From WWF's website</footer>
		</blockquote>
	</div>
	<div class="container">
		<h1>Keyboard Inputs</h1>
		<p>kbd태그를 이용하면 단축키 같은 표현을 쉽게 사용할 수 있다.</p>
		<p>Use <kbd>ctrl + p</kbd> to open the Print dialog box.</p>
		<button><kbd>button</kbd></button>
	</div>
</body>
</html>