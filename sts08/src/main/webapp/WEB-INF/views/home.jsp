<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html>
<head>
<meta charset="utf-8">
<title>Home</title>
<link rel="stylesheet" type="text/css" href="css/bootstrap.css" />
<link rel="stylesheet" type="text/css" href="css/bootstrap-theme" />
<script type="text/javascript" src="js/jquery-1.12.4.min.js "></script>
<script type="text/javascript" src="js/bootstrap.js "></script>
<script type="text/javascript">
	$(document).ready(function() {
		pageIdx();
		$('nav a').click(function(e) {
			e.preventDefault();

		});

		$('nav a').eq(0).click(function(e) {
			e.preventDefault();
			pageIdx();

		});

		$('nav a').eq(1).click(function(e) {
			e.preventDefault();
			pageIdx();

		});
		$('nav a').eq(2).click(function(e) {
			e.preventDefault();
			pageIntro();

		});
		$('nav a').eq(3).click(function(e) {
			e.preventDefault();
			pageIntro();

		});
		$('nav a').eq(4).click(function(e) {
			e.preventDefault();
			getList();

		});
		$('nav a').eq(5).click(function(e) {
			e.preventDefault();
			getAdd();
		});
		$(document).on('click', '#content table tr td>a', function(e) {
			e.preventDefault();

			$.getJSON('json/obj', $(this).attr('href'), function(data) {
				myModal();
				$('#myModal .modal-header h4').text("수정페이지");
				$('#myModal form input').eq(0).val(data.num);
				$('#myModal form input').eq(1).val(data.sub);
				$('#myModal form input').eq(2).val(data.name);
				$('#myModal form textarea').val(data.content);
				$('#myModal .modal-footer button').eq(2).show();
				
			});
		});

	});

	function updateOne(){
		$.ajax({
			url:'json/obj',
			type:'put',
			data:'idx=1',
			//dataType:
			success:function(data){

			}
		});
	}

	function insertOne() {
		var params = $('#myModal form').serialize();
		$.post('json/add', params, function() {
			$('#myModal form input').val("");
			$('#myModal form textarea').val("");
			getList();
		});
	}
	function myModal() {
		$('#myModal .modal-header h4').text("입력페이지");
		$('#myModal form input').eq(0).val('');
		$('#myModal form input').eq(1).val('');
		$('#myModal form input').eq(2).val('');
		$('#myModal form textarea').val('');
		var options = {
			show : true
		};
		$('#myModal').modal(options);
		$('#myModal .modal-footer button').hide().eq(0).show();
	}

	function getAdd() {
		getList();
		myModal();
		$('#myModal .modal-footer button').eq(1).show();
	}

	function getList() {
		$('nav a').eq(1).parent().removeClass('active');
		$('nav a').eq(2).parent().removeClass('active');
		$('nav a').eq(3).parent().addClass('active');

		var eles = $('<h1>리스트 페이지</h1>');
		var table = $('<table class="table"></table>').appendTo(eles);
		$('<tr></tr>').appendTo(table).append('<th>글번호</th>').append(
				'<th>제목</th>').append('<th>글쓴이</th>').append('<th>조회수</th>');

		$.getJSON('json/list', function(data) {
			var arr = data;

			for (var i = 0; i < arr.length; i++) {
				$('<tr></tr>').appendTo(table).append(
						'<td><a href="idx='+arr[i].num+'">' + arr[i].num
								+ '</a></td>').append(
						'<td><a href="idx='+arr[i].num+'">' + arr[i].sub
								+ '</a></td>').append(
						'<td><a href="idx='+arr[i].num+'">' + arr[i].name
								+ '</a></td>').append(
						'<td><a href="idx='+arr[i].num+'">' + arr[i].cnt
								+ '</a></td>');
			}
			$('#content').html(eles);
		});
	}

	function pageIdx() {
		$('nav a').eq(1).parent().addClass('active');
		$('nav a').eq(2).parent().removeClass('active');
		$('nav a').eq(3).parent().removeClass('active');
		var ele = '<img src="imgs/b05.jpg" class="img=thumbnail" />';
		ele += '<img src="imgs/b06.jpg" class="img=thumbnail" />';

		$('#content').html(ele);

	}

	function pageIntro() {
		$('nav a').eq(1).parent().removeClass('active');
		$('nav a').eq(3).parent().removeClass('active');
		$('nav a').eq(2).parent().addClass('active');

		var ele = '<img src="imgs/b01.jpg" class="img=thumbnail" />';
		ele += '<img src="imgs/b02.jpg" class="img=thumbnail" />';

		$('#content').html(ele);
	}
</script>
</head>
<body>
	<h1></h1>
	<div class="modal fade" id="myModal" tabindex="-1" role="dialog"
		aria-labelledby="myModalLabel">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
					<h4 class="modal-title" id="myModalLabel">Modal title</h4>
				</div>
				<form class="form-horizontal">
					<input type="hidden" name="num" />
					<div class="modal-body">
						<div class="container-fluid">
							<div class="form-group">
								<label for="sub" class="col-sm-2 control-label">제목</label>
								<div class="col-sm-10">
									<input type="text" class="form-control" id="sub"
										placeholder="제목을 입력하세요" name="sub">
								</div>
							</div>
							<div class="form-group">
								<label for="name" class="col-sm-2 control-label">이름</label>
								<div class="col-sm-10">
									<input type="text" class="form-control" id="name"
										placeholder="이름을 입력하세요" name="name">
								</div>
							</div>
							<div class="form-group">
								<label for="content" class="col-sm-2 control-label"></label>
								<div class="ol-sm-offset-2 col-sm-10">
									<textarea class="form-control" name="content" id="cntnt"> </textarea>
								</div>
							</div>

						</div>
					</div>
					<div class="modal-footer">
						<button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
						<button type="button" class="btn btn-primary" data-dismiss="modal"onclick="insertOne();">입력</button>
						<button type="button" class="btn btn-primary" data-dismiss="modal"onclick="updateOne();">수정</button>
					</div>
				</form>
			</div>
		</div>
	</div>

	<nav class="navbar navbar-default navbar-fixed-top">
		<div class="container-fluid">
			<!-- Brand and toggle get grouped for better mobile display -->
			<div class="navbar-header">
				<button type="button" class="navbar-toggle collapsed"
					data-toggle="collapse" data-target="#bs-example-navbar-collapse-1"
					aria-expanded="false">
					<span class="sr-only">Toggle navigation</span> <span
						class="icon-bar"></span> <span class="icon-bar"></span> <span
						class="icon-bar"></span>
				</button>
				<a class="navbar-brand" href="#">비트교육센터</a>
			</div>

			<!-- Collect the nav links, forms, and other content for toggling -->
			<div class="collapse navbar-collapse"
				id="bs-example-navbar-collapse-1">
				<ul class="nav navbar-nav">
					<li class="active"><a href="#">home <span class="sr-only">(current)</span></a></li>
					<li><a href="#">intro</a></li>
					<li class="dropdown"><a href="#" class="dropdown-toggle"
						data-toggle="dropdown" role="button" aria-haspopup="true"
						aria-expanded="false">bbs <span class="caret"></span></a>
						<ul class="dropdown-menu">
							<li><a href="#">list page</a></li>
							<li role="separator" class="divider"></li>
							<li><a href="#">add page</a></li>
						</ul></li>
				</ul>
				<div class="container-fluid">
					<div class="row">
						<div class="col-md-12">
							<div class="jumbotron">
								<h1>hi</h1>
							</div>
						</div>
					</div>
					<div class="row">
						<div class="col-md-12" id="content"></div>
					</div>
					<div class="row">
						<div id="footer" class="col-md-12">
							<address>
								<strong>Twitter, Inc.</strong> <br> 1355 Market Street,
								Suite900 <br> San Francisco, CA 94103 <br> <abbr
									title="Phone">P:</abbr> (010) 2731-4257
							</address>
							<address>
								<strong>Park CheolYong</strong><br> <a href="mailto:#">cjfdyd4257@gmail.com</a>
							</address>
						</div>
					</div>
				</div>
				<!-- /.navbar-collapse -->
			</div>
			<!-- /.container-fluid -->
		</div>
	</nav>
</body>
</html>