<?php
$maxPage = $data->total_pages;

if ($maxPage > 1) {
	$count = 0;
?>
<div class="row text-center">
	<ul class="pagination">
		<?php if ($currentPage > 1) {?>
			<li>
				<a href="<?php echo $this->router->getRewriteUri();?>"><i class="fa fa-chevron-left"></i><i class="fa fa-chevron-left"></i></a>
			</li>
			<li>
				<?php if ($currentPage == 2) {?>
					<a href="<?php echo $this->router->getRewriteUri();?>"><i class="fa fa-chevron-left"></i></a>
				<?php } else {?>
					<a href="<?php echo $this->router->getRewriteUri();?>?page=<?php echo ($currentPage - 1)?>"><i class="fa fa-chevron-left"></i></a>
				<?php }?>		
			</li>
		<?php } 
			for($i = 1; $i <= $maxPage; $i++) {
				if ($count < 5) {
					if ($i < $currentPage) {
						if ($maxPage - $currentPage >= 2) {
							if ($currentPage - $i <= 2) {?>
								<li>
	                                <?php if ($i == 1) {?>
	                                	<a href="<?php echo $this->router->getRewriteUri();?>"><?php echo $i?></a>
	                                <?php } else {?>
	                                    <a href="<?php echo $this->router->getRewriteUri();?>?page=<?php echo $i?>"><?php echo $i?></a>
	                                <?php }
	                                $count = $count + 1; ?>
	                            </li>			
		<?php
							} 
						}
						if ($maxPage - $currentPage	< 2) {
							if ($maxPage - $i < 5) {?>
								<li>
	                                <?php if ($i == 1) {?>
	                                	<a href="<?php echo $this->router->getRewriteUri();?>"><?php echo $i?></a>
	                                <?php } else {?>
	                                    <a href="<?php echo $this->router->getRewriteUri();?>?page=<?php echo $i?>"><?php echo $i?></a>
	                                <?php }
	                                $count = $count + 1; ?>
	                            </li>	
		<?php
							}
						}
					}
					if ($currentPage == $i) { ?>
						<li class="active"><a href="javascript:void(0);"><?php echo $i?></a></li>
					<?php
						$count = $count + 1;
					}
					if ($i > $currentPage) {?>
						<li>
							<a href="<?php echo $this->router->getRewriteUri();?>?page=<?php echo $i?>"><?php echo $i?></a>
						</li>
					<?php 
						$count = $count + 1;
					}
				}
			}
			if ($currentPage < $maxPage) {?>
				<li>
					<a href="<?php echo $this->router->getRewriteUri();?>?page=<?php echo ($currentPage + 1)?>"><i class="fa fa-chevron-right"></i></a>
	            </li>
	            <li>
	            	<a href="<?php echo $this->router->getRewriteUri();?>?page=<?php echo $maxPage?>"><i class="fa fa-chevron-right"></i><i class="fa fa-chevron-right"></i></a>
	            </li>
			<?php }
		?>
	</ul>
</div>

<?php }?>