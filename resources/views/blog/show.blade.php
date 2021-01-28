@if($data['post']['featured_image'])
    <img src="{{ url($data['post']['featured_image']) }}" alt="{{ $data['post']['featured_image_caption'] }}" />
@endif
<h2>{{ $data['post']['title'] }}</h2>
{!! $data['post']['body'] !!}
