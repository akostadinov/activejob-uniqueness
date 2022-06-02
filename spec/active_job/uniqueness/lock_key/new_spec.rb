# frozen_string_literal: true

describe ActiveJob::Uniqueness::LockKey, '.new' do
  context 'when no job_class_name given' do
    context 'when arguments given' do
      subject(:initialize_lock_key) { described_class.new(arguments: [1, 2]) }

      it 'raises ArgumentError' do
        expect { initialize_lock_key }.to raise_error(ArgumentError, 'job_class_name is required if arguments given')
      end
    end

    context 'when no arguments given' do
      subject(:initialize_lock_key) { described_class.new }

      it 'does not raise error' do
        expect { initialize_lock_key }.not_to raise_error
      end
    end
  end

  context 'when job_class_name given' do
    context 'when arguments given' do
      subject(:initialize_lock_key) { described_class.new(job_class_name: 'FooJob', arguments: [1, 2]) }

      it 'does not raise error' do
        expect { initialize_lock_key }.not_to raise_error
      end
    end

    context 'when no arguments given' do
      subject(:initialize_lock_key) { described_class.new(job_class_name: 'FooJob') }

      it 'does not raise error' do
        expect { initialize_lock_key }.not_to raise_error
      end
    end
  end
end
