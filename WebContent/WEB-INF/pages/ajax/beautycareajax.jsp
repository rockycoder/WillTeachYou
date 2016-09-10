<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>


<c:forEach var="product" items="${productList}">
	<div class="col-xs-6 col-sm-4 col-md-3 productlisting"
		style="height: 55%;">
		<div class="grid-item _1 ">
			<div class="image">
				<c:choose>
					<c:when test="${product.categoryId==5}">
						<a
							href="<%=request.getContextPath()%>/beautyCareDetail?id=${product.productId}#${fn:replace(product.features['Brand Name'],' ','-')} ${fn:replace(product.productName,' ','-')}">
							<img src="../${product.images['image1']}"
							alt="${fn:replace(product.features['Brand Name'],' ','-')} ${fn:replace(product.productName,' ','-')}"
							style="height: 128px; width: 128px">
						</a>
					</c:when>

				</c:choose>
				<c:choose>
					<c:when test="${product.categoryId==2}">
						<a
							href="<%=request.getContextPath()%>/fragranceDetails?id=${product.productId}#${fn:replace(product.features['Brand Name'],' ','-')} ${fn:replace(product.productName,' ','-')}">
							<img src="${product.images['image1']}"
							alt="${fn:replace(product.features['Brand Name'],' ','-')} ${fn:replace(product.productName,' ','-')}"
							style="height: 128px; width: 128px">
						</a>
					</c:when>

				</c:choose>

				<div class="action">
					<div class="group">
						<c:choose>
							<c:when test="${product.categoryId==5}">
								<a id="detailView" name="${product.productId}"
									href="<%=request.getContextPath()%>/beautyCareDetail?id=${product.productId}#${fn:replace(product.features['Brand Name'],' ','-')} ${fn:replace(product.productName,' ','-')}"><i
									class="fa fa-eye"></i></a>
							</c:when>

						</c:choose>
						<c:choose>
							<c:when test="${product.categoryId==2}">
								<a id="detailView" name="${product.productId}"
									href="<%=request.getContextPath()%>/fragranceDetails?id=${product.productId}#${fn:replace(product.features['Brand Name'],' ','-')} ${fn:replace(product.productName,' ','-')}"><i
									class="fa fa-eye"></i></a>
							</c:when>

						</c:choose>

					</div>
					<div class="rating">
						<span class="star"> <i class="fa fa-star-o"></i> <i
							class="fa fa-star-o"></i> <i class="fa fa-star-o"></i> <i
							class="fa fa-star-o"></i> <i class="fa fa-star-o"></i>
						</span> 0 Review(s)
					</div>
				</div>
			</div>
			<div class="text listtext">
				<div class="price-box">
					<div>
						<c:choose>
							<c:when test="${product.categoryId==5}">
								<a id="detailView" style="text-decoration: none; color: black;"
									name="2"
									href="beautyCareDetail?id=${product.productId}#${fn:replace(product.features['Brand Name'],' ','-')} ${fn:replace(product.productName,' ','-')}">
									<p class="special-price">
										<span class="price">${product.productName}</span>
								</a>
							</c:when>

						</c:choose>
						<c:choose>
							<c:when test="${product.categoryId==2}">
								<a id="detailView" style="text-decoration: none; color: black;"
									name="2"
									href="<%=request.getContextPath()%>/fragranceDetails?id=${product.productId}#${fn:replace(product.features['Brand Name'],' ','-')} ${fn:replace(product.productName,' ','-')}">
									<p class="special-price">
										<span class="price">${product.productName}</span>
								</a>
							</c:when>

						</c:choose>


						</p>
					</div>
					<div>
						<c:choose>
							<c:when test="${product.categoryId==5}">
								<a id="detailView" style="text-decoration: none; color: black;"
									name="2"
									href="<%=request.getContextPath()%>/beautyCareDetail?id=${product.productId}#${fn:replace(product.features['Brand Name'],' ','-')} ${fn:replace(product.productName,' ','-')}">
									<p class="special-price">
										<span class="price">${product.features["Brand Name"]}</span>
								</a>
							</c:when>

						</c:choose>
						<c:choose>
							<c:when test="${product.categoryId==2}">
								<a id="detailView" style="text-decoration: none; color: black;"
									name="2"
									href="<%=request.getContextPath()%>/fragranceDetails?id=${product.productId}#${fn:replace(product.features['Brand Name'],' ','-')} ${fn:replace(product.productName,' ','-')}">
									<p class="special-price">
										<span class="price">${product.features["Brand Name"]}</span>
								</a>
							</c:when>

						</c:choose>

						</p>
					</div>
					<div>
						<c:choose>
							<c:when test="${product.categoryId==5}">
								<a id="detailView" style="text-decoration: none; color: black;"
									name="2"
									href="<%=request.getContextPath()%>/beautyCareDetail?id=${product.productId}#${fn:replace(product.features['Brand Name'],' ','-')} ${fn:replace(product.productName,' ','-')}">
									<p class="special-price">
										<span class="price"><i class="fa fa-inr"></i>
											${product.features["Trial Price"]} (Trial Price)</span>
								</a>
							</c:when>

						</c:choose>
						<c:choose>
							<c:when test="${product.categoryId==2}">
								<a id="detailView" style="text-decoration: none; color: black;"
									name="2"
									href="<%=request.getContextPath()%>/fragranceDetails?id=${product.productId}#${fn:replace(product.features['Brand Name'],' ','-')} ${fn:replace(product.productName,' ','-')}">
									<p class="special-price">
										<span class="price"><i class="fa fa-inr"></i>
											${product.features["Trial Price"]} (Trial Price)</span>
								</a>
							</c:when>

						</c:choose>


						</p>
					</div>
				</div>
			</div>
		</div>
	</div>
</c:forEach>