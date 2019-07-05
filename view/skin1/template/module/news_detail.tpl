<div class="ben-post">
	
    <h2><?php echo $post['title']?></h2>
    <div class="ben-post-date"><?php echo $post['statusdate']?></div>
    <div class="ben-post-body">
        <p><b><?php echo $post['summary']?></b></p>
    </div>
    <div class="clearer">&nbsp;</div>
</div>
<div id="fb-root"></div>
<script>(function(d, s, id) {
  var js, fjs = d.getElementsByTagName(s)[0];
  if (d.getElementById(id)) return;
  js = d.createElement(s); js.id = id;
  js.src = "//connect.facebook.net/en_US/all.js#xfbml=1";
  fjs.parentNode.insertBefore(js, fjs);
}(document, 'script', 'facebook-jssdk'));</script>        
        
        <div class="fb-like" data-href="<?php echo $post['link']?>" data-layout="button" data-action="like" data-show-faces="true" data-share="true"></div>
<div class="ben-hline"></div>
<p>
    <?php echo $post['description']?>
</p>
<p class="ben-text-right">
	<b><?php echo $post['source']?></b>
</p>
<div class="ben-hline"></div>

<?php if($othernews) {?>
<h3>Các tin khác</h3>             
<div>
    <ul>
    	<?php foreach($othernews as $media) {?>
        <li><a href="<?php echo $media['link']?>"><?php echo $media['title']?>&nbsp;<span class="ben-other">(<?php echo $media['statusdate']?>)</span></a></li>
        <?php } ?>    
    </ul>
</div>
<?php } ?>

<div class="clearer">&nbsp;</div>