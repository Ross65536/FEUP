<li class="auction-item">
    <a href="{{ url("auctions/{$auction->id}") }}" class="d-flex">
        <div>
            <img class="auction-image" src="{{ $auction->getDisplayPictureURL() }}" alt="auction image">
        </div>
        <div class="auction-text">
            <h4> {{ $auction->item_name }} </h4>
            <p class="d-flex justify-content-between">
                        <span>
                            <b>EUR {{ $auction->currentPriceEuros() }},</b>
                            <span class="text-muted">{{ $auction->numBids() }} Bids </span>
                        </span>
                <span class="text-muted"> {{ $auction->getTimeLeftString() }} left </span>
            </p>
            <p>{{ str_limit($auction->description, 150, ' ...') }}</p>
        </div>
    </a>
</li>