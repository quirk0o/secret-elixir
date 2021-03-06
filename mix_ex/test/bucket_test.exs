defmodule MixEx.BucketTest do
	use ExUnit.Case, async: true

	setup do
		{:ok, bucket} = MixEx.Bucket.start_link
		{:ok, bucket: bucket}
	end

	test "bucket is initially empty", %{bucket: bucket} do
		assert MixEx.Bucket.get(bucket, "milk") == nil
	end

	test "stores values by key", %{bucket: bucket} do
		MixEx.Bucket.put(bucket, "milk", 3)
		assert MixEx.Bucket.get(bucket, "milk") == 3
	end

	test "deletes value by key", %{bucket: bucket} do
		MixEx.Bucket.put(bucket, "milk", 3)

		assert MixEx.Bucket.delete(bucket, "milk") == 3
		assert MixEx.Bucket.get(bucket, "milk") == nil
	end
end
