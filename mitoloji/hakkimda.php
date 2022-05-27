<!-- <header> -->
	<?php require_once 'header.php'; ?>
	<!-- </header> -->

	<?php
	$hakkimizda_id = 1;
	$hakkimizda = $db->prepare("SELECT * FROM hakkimizda WHERE hakkimizda_id=?");
	$hakkimizda->execute(array($hakkimizda_id));
	$hakkimizda_cek = $hakkimizda->fetch(PDO::FETCH_ASSOC);

	?>

	<div id="columns" class="container">

		<!-- Column 1 -->
		<div id="column-1">
			<!-- <div class="page-subject"> HAKKIMDA </div> -->
			<div class="page-cont box-shadow">
				<div id="hakkimda" style="text-align:center;">
				
					<br>
					Mitolojilere olan ilgim beni bu siteyi açma konusunda motive etti bu sitede beraber mitolojiler hakkında daha fazla bilgi sahibi olmayı amaçlıyorum<br>
					Konularla alakalı sorularınızı ve önerilerinizi iletişim sayfasında bulunan iletişim adreslerinden veya yorumlarda iletebilirsiniz.<br>
					<?php echo $hakkimizda_cek["hakkimizda_aciklama"]; ?>
					<ul style="margin-top: 20px;">

						

					</ul>
				</div>
			</div>
			<div style="clear:both;"></div>
		</div>
		<!-- Column 1 END -->

		<!-- Column 2 -->
		<?php require_once 'sag.php'; ?>
		<!-- Column 2 END -->

		<div style="clear:both;"></div>
	</div>

	<!--<footer> -->
		<?php require_once "footer.php"; ?>
		<!--</footer>  -->
