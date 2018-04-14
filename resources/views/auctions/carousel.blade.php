
<!-- auctions carousel -->
<div id="carouselAuctions" class="carousel slide mt-4 mx-auto" data-ride="carousel">
    <div class="carousel-inner">
        @php ($activeItem = "active")
        @foreach($displayAuctions as $auction)
        <div class="carousel-item {{ $activeItem }}">
            <a href="../auction/auction.html">
                <img class="d-block " src="https://placeimg.com/480/480/arch" alt="Second slide">
                <div class="carousel-caption d-md-block">
                    <h3>{{ $auction->item_name }}</h3>
                    <h4><strong class="display-4">
                            @if($auction->current_price === null)
                                0
                            @else
                            {{ $auction->current_price }}
                            @endif
                            €
                        </strong></h4>
                    <h5>5 bids</h5>
                </div>
            </a>
        </div>
        @php ($activeItem = "")
        @endforeach
    </div>
    <a class="carousel-control-prev" href="#carouselAuctions" role="button" data-slide="prev">
        <span class="carousel-control-prev-icon" aria-hidden="true"></span>
        <span class="sr-only">Previous</span>
    </a>
    <a class="carousel-control-next" href="#carouselAuctions" role="button" data-slide="next">
        <span class="carousel-control-next-icon" aria-hidden="true"></span>
        <span class="sr-only">Next</span>
    </a>
</div>