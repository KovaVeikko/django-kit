from rest_framework import serializers, views, status
from rest_framework.response import Response
from App.models import Example

class ExampleSerializer(serializers.ModelSerializer):
    class Meta:
        model = Example
        fields = '__all__'


class ExampleAPI(views.APIView):
    def get(self, request):
        queryset = Example.objects.all()
        serializer = ExampleSerializer(queryset, many=True)
        return Response(serializer.data)

    def post(self, request):
        serializer = ExampleSerializer(data=request.data)
        if serializer.is_valid():
            serializer.save()
            return Response(serializer.data, status=status.HTTP_201_CREATED)
        return Response(serializer.errors, status=status.HTTP_400_BAD_REQUEST)
