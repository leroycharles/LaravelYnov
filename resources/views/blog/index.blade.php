<ul>
    @foreach($data['posts'] as $d)
        <li>
            <h2><a href="{{url($d['slug'])}}">{{ $d['title'] }}</a></h2>
            <p>{!! $d['body'] !!}</p>
        </li>
    @endforeach
</ul>
