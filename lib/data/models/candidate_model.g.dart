// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'candidate_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class CandidateAdapter extends TypeAdapter<Candidate> {
  @override
  final int typeId = 0;

  @override
  Candidate read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Candidate(
      name: fields[0] as String,
      teamName: fields[1] as String,
      imagePath: fields[2] as String,
      voteCount: fields[3] as int,
    );
  }

  @override
  void write(BinaryWriter writer, Candidate obj) {
    writer
      ..writeByte(4)
      ..writeByte(0)
      ..write(obj.name)
      ..writeByte(1)
      ..write(obj.teamName)
      ..writeByte(2)
      ..write(obj.imagePath)
      ..writeByte(3)
      ..write(obj.voteCount);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is CandidateAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
