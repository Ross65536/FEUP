@extends('layouts.base')

@section('resources')
@parent
<link rel="stylesheet" href="{{ asset('css/report.css') }}">
@endsection

@section('content')

<div class="container">

    {{$rep}}
    <h3 class="border-bottom pb-1 mb-4 mt-5"> Account reports </h3>
    @foreach($rep as $report)
        <div id="accordion">
            <div class="card">
                <div class="card-header" id="heading1" style="background-color:#ecf0f1; border-color:#e74c3c">
                    <div class="row">
                        <div class="col-9">
                            <a href="profile/ {{$report->user_id}}"> {{App\User::find($report->user_id)->username}} </a>&nbsp;
                            <a class="btn-link" data-toggle="collapse" data-target="#collapse1" aria-expanded="true" aria-controls="collapse1">
                                <input type="hidden" id="message_complete" value="{{$report->message}}">
                                @if($report->is_user)
                                <span style="color:black">  said:</span> <h4 class="dropdown-toggle">   {{$report->subject}}  </h4> about <a href="profile/{{$report->reported_user}} "> {{App\User::find($report->reported_user)->username}}  	&nbsp; </a>
                                @else
                                <span style="color:black">  said:</span> <h4 class="dropdown-toggle">   {{$report->subject}}  </h4> about <a href="auctions/{{$report->auction_id}}"> {{App\Auction::find($report->auction_id)->item_name}}  	&nbsp; </a>
                                @endif
                            </a>
                        </div>
                        <div class="col-3">
                        </div>
                    </div>
                </div>
                <div id="collapse1" class="collapse show" aria-labelledby="heading1" data-parent="#accordion">
                    <div class="card-body">
                        {{$report->message}}

                        <div class="row">
                            <div class="col-9"></div>
                            <div class="col-3">
                                <button id = "sendbtn" type="button" class="btn btn-success ""> Send Answer </button></div>
                        </div>
                    </div>
                </div>
        </div>

    </div>
    @endforeach

</div>
@endsection