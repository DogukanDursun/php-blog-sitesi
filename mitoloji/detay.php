<!-- <header> -->
	
	<?php require_once 'header.php'; ?>
	<base href="http://mitolojilerle.com/">
	<!-- </header> -->
	<?php
	
	$yazi_seolink = $_GET["yazi_seolink"];

	$yazilar = $db->prepare("SELECT * FROM yazilar  INNER JOIN kategoriler ON kategoriler.kategori_id = yazilar.yazi_kategori_id
    Where yazi_seolink=? ");
	$yazilar-> execute(array($yazi_seolink));
	$yazi_cek = $yazilar->fetch(PDO::FETCH_ASSOC);



	
		 $goruntulenme   = @$_COOKIE[$row->yazi_seolink];
                                if(!$goruntulenme){
                                    $okunmasayisi = $db->prepare("UPDATE yazilar SET yazi_okunma=:g WHERE yazi_seolink=:id");
                                    $okunmasayisi->execute([':g'=>$row->yazi_okunma + 1,':id' => $yazi_seolink]);
                                    setcookie($row->yazi_id,'1',time() + 3600);
		
	}
	?>
	<div id="columns" class="container">
		<!-- Column 1 -->
		<div id="column-1">
			<!-- Post -->
			<div class="post">
				<div class="post-header">
					<h1><?php echo $yazi_cek["yazi_baslik"]; ?></h1>
				</div>
				<div class="post-meta">
					<p>
					<span><a href="hakkimda"><i class="mdi mdi-account-circle"></i> Admin</a></span>
						<span><a href="kategori/<?php echo $yazi_cek['kategori_url']; ?>"><i class="mdi mdi-pound-box"></i> <?php echo $yazi_cek["kategori_baslik"]; ?></a></span>
						<span><i class="mdi mdi-calendar-clock"></i> <?php echo SaatliTarih($yazi_cek["yazi_tarih"]); ?></span>
						<!-- yorum toplam -->
						<?php
						$yorumlar = $db->prepare("SELECT * FROM yorumlar WHERE yorum_yazi_id=? AND yorum_durum=?");
						$yorumcek = $yorumlar->execute(array($yazi_cek["yazi_seolink"],1));
						$yorumsay = $yorumlar->rowCount();
						if ($yorumsay) {
							?>
							<span><i class="mdi mdi-comment"></i> <strong><?php echo $yorumsay; ?></strong> Yorum</span>
							<?php }else{ ?>
					
							<?php } ?>
							<span style="border:0;"><i ></i> </span>
						</p>
					</div>
					<div class="post-thumbnail">
						<img src="img/yazilar/<?php echo $yazi_cek["yazi_foto"]; ?>" >
					</div>
					<div class="post-text">
						<p style = "font-family:arial,helvetica;">
							<?php echo $yazi_cek["yazi_icerik"]; ?>

</p>
					</div>
					<div style="clear:both;"></div>
					<div class="post-info">
						<p>Yazımıza yorum atmayı unutmayınız görüş ve önerilerinizi yorumlarda belirtiniz
						</p>
						<div style="clear:both;"></div>
					</div>

				</div>
				<!-- Post -->
				<!-- Related Post-->
				<div class="related-post" style="padding-bottom: 0;">
					<h2>Benzer Yazılar</h2>
					<?php
					$yazilar = $db->prepare("SELECT * FROM yazilar WHERE yazi_kategori_id=? ORDER BY yazi_seolink DESC LIMIT 4");
					$yazilar->execute(array($yazi_cek["kategori_id"]));
					$yazicek = $yazilar->fetchALL(PDO::FETCH_ASSOC);

					foreach ($yazicek as $row) { ?>
					<div class="related-post-item">
						 <a href="yazilar/<?php echo $row ["yazi_seolink"]; ?>" title="<?php echo $row["yazi_baslik"]; ?>"><img src="img/yazilar/<?php echo $row["yazi_foto"]; ?>" alt="Fashion"/></a>
						<p><?php echo SaatliTarih($row["yazi_tarih"]); ?></p>
					</div>
					<?php } ?>
				</div>
				<!-- Related Post End -->
				<!-- Yorumlar-->
				<div class="related-post">
					<h2>Yapılan Yorumlar</h2>
					<?php
					$yorumlar = $db->prepare("SELECT * FROM yorumlar WHERE yorum_yazi_id=? AND yorum_durum=? AND yorum_ust=?");
					$yorumlar->execute(array($yazi_cek["yazi_id"],1,0));
					$yorumcek = $yorumlar->fetchALL(PDO::FETCH_ASSOC);
					$say = $yorumlar->rowCount();

					if ($say) {
						foreach ($yorumcek as $row) { ?>
						<div class="sidebar-post" style="height: auto;">
							<div class="sidebar-post-info">
								<b style="text-transform: capitalize;"><?php echo $row["yorum_ekleyen"]; ?></b>
								<span style="float:right;"><?php echo SaatliTarih($row["yorum_tarih"]); ?></span>
							</div>
							<div class="sidebar-post-meta">
								<p><big><i><?php echo $row["yorum_icerik"]; ?></i></big></p>
							</div>
							<!-- cevap -->
							<?php
							$yanitlar = $db->prepare("SELECT * FROM yorumlar WHERE yorum_ust=?");
							$yanitlar->execute(array($row["yorum_id"]));
							$yanitcek = $yanitlar->fetchALL(PDO::FETCH_ASSOC);
							foreach ($yanitcek as $ycek) { ?>
							<div class="sidebar-post" style="height: auto; background-color: #ddd; margin-top: 10px;">
								<div class="sidebar-post-info">
									<b style="text-transform: capitalize;"><?php echo $ycek["yorum_ekleyen"]; ?></b>
									<span style="float:right;"><?php echo SaatliTarih($ycek["yorum_tarih"]); ?></span>
								</div>
								<div class="sidebar-post-meta">
									<p><big><b>Cevap</b> : <i><?php echo $ycek["yorum_icerik"]; ?></i></big></p>
								</div>
							</div>
							<?php } ?>
							<!-- end cevap -->
						</div>
						<?php } }else{ ?>
						<p style="margin-left: 15px;"><i>Bu konuya hiç yorum yapılmamış! İlk yorum yapan sen ol!</i></p>
						<?php } ?>
					</div>
					<!-- Yorumlar End -->
					<!-- Yorum Yap-->
					<div class="related-post" style="padding-bottom: 0;">
						<h2>Yorum Yap</h2>
						<div id="page" style="padding: 0; margin-left: 15px; width: 100%;">
							<form id="yorumForm" action="" method="post" onsubmit="return false;">
								<p class="cont">Lütfen aşağıdaki alanları eksiksiz doldurunuz.</p>
								<input type="hidden" name="yorum_yazi_id" value="<?php echo $yazi_cek["yazi_id"]; ?>"/>
								<div class="fieldset">
									<input type="text" name="yorum_ekleyen" placeholder="Adınız Soyadınız"/>
								</div>
								<div class="fieldset">
									<input type="email" name="yorum_eposta" placeholder="Email Adresiniz"/>
								</div>
								
								<div style="clear:both;"></div>
								<div class="fieldset-textarea">
									<textarea name="yorum_icerik" rows="10" placeholder="Mesajınız..."></textarea>
								</div>
								<button type="submit" onclick="yorumGonder();" class="submit" style="float:right; margin-right:3%; margin-top:3%; margin-bottom:5%;">Gönder</button>
							</form>
						</div>
					</div>
					<!-- Yorum Yap End -->
					<script>
						function yorumGonder() {
							var degerler = $("#yorumForm").serialize();

							$.ajax({
								type : "POST",
								url  : "yorum-yap.php",
								data : degerler,
								success: function (sonuc) {
									if(sonuc == "bos"){
										swal("Dikkat!","Lütfen boş alan bırakmayınız!","warning");
									}else if(sonuc == "no"){
										swal("Hata!","Yorum gönderilirken bir hata oluştu!","error");
									}else if(sonuc == "yes"){
										swal({
											title : "Tebrikler!",
											text  : "Yorumunuz başarıyla gönderildi!",
											type  : "success",
											html  : true,
											timer : 2000},
											function () {
												location.reload();
											});
									}
								}
							});
						}
					</script>
				</div>
				<!-- Column 1 END -->

				<!-- Column 2 -->
				<?php require_once 'sag.php'; ?>
				<!-- Column 2 END -->

				<div style="clear:both;"></div>
			</div>

			<!-- <footer> -->
				<?php require_once 'footer.php'; ?>
				<!-- </footer> -->
