// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'valley_well_model.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

extension GetValleyWellModelCollection on Isar {
  IsarCollection<ValleyWellModel> get valleyWellModels => this.collection();
}

const ValleyWellModelSchema = CollectionSchema(
  name: r'ValleyWellModel',
  id: 294181291978891119,
  properties: {
    r'question': PropertySchema(
      id: 0,
      name: r'question',
      type: IsarType.string,
    ),
    r'questionAnswer': PropertySchema(
      id: 1,
      name: r'questionAnswer',
      type: IsarType.string,
    )
  },
  estimateSize: _valleyWellModelEstimateSize,
  serialize: _valleyWellModelSerialize,
  deserialize: _valleyWellModelDeserialize,
  deserializeProp: _valleyWellModelDeserializeProp,
  idName: r'id',
  indexes: {},
  links: {},
  embeddedSchemas: {},
  getId: _valleyWellModelGetId,
  getLinks: _valleyWellModelGetLinks,
  attach: _valleyWellModelAttach,
  version: '3.1.0+1',
);

int _valleyWellModelEstimateSize(
  ValleyWellModel object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  bytesCount += 3 + object.question.length * 3;
  {
    final value = object.questionAnswer;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  return bytesCount;
}

void _valleyWellModelSerialize(
  ValleyWellModel object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeString(offsets[0], object.question);
  writer.writeString(offsets[1], object.questionAnswer);
}

ValleyWellModel _valleyWellModelDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = ValleyWellModel(
    question: reader.readString(offsets[0]),
    questionAnswer: reader.readStringOrNull(offsets[1]),
  );
  return object;
}

P _valleyWellModelDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readString(offset)) as P;
    case 1:
      return (reader.readStringOrNull(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

Id _valleyWellModelGetId(ValleyWellModel object) {
  return object.id;
}

List<IsarLinkBase<dynamic>> _valleyWellModelGetLinks(ValleyWellModel object) {
  return [];
}

void _valleyWellModelAttach(
    IsarCollection<dynamic> col, Id id, ValleyWellModel object) {}

extension ValleyWellModelQueryWhereSort
    on QueryBuilder<ValleyWellModel, ValleyWellModel, QWhere> {
  QueryBuilder<ValleyWellModel, ValleyWellModel, QAfterWhere> anyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }
}

extension ValleyWellModelQueryWhere
    on QueryBuilder<ValleyWellModel, ValleyWellModel, QWhereClause> {
  QueryBuilder<ValleyWellModel, ValleyWellModel, QAfterWhereClause> idEqualTo(
      Id id) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: id,
        upper: id,
      ));
    });
  }

  QueryBuilder<ValleyWellModel, ValleyWellModel, QAfterWhereClause>
      idNotEqualTo(Id id) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(
              IdWhereClause.lessThan(upper: id, includeUpper: false),
            )
            .addWhereClause(
              IdWhereClause.greaterThan(lower: id, includeLower: false),
            );
      } else {
        return query
            .addWhereClause(
              IdWhereClause.greaterThan(lower: id, includeLower: false),
            )
            .addWhereClause(
              IdWhereClause.lessThan(upper: id, includeUpper: false),
            );
      }
    });
  }

  QueryBuilder<ValleyWellModel, ValleyWellModel, QAfterWhereClause>
      idGreaterThan(Id id, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: id, includeLower: include),
      );
    });
  }

  QueryBuilder<ValleyWellModel, ValleyWellModel, QAfterWhereClause> idLessThan(
      Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: id, includeUpper: include),
      );
    });
  }

  QueryBuilder<ValleyWellModel, ValleyWellModel, QAfterWhereClause> idBetween(
    Id lowerId,
    Id upperId, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: lowerId,
        includeLower: includeLower,
        upper: upperId,
        includeUpper: includeUpper,
      ));
    });
  }
}

extension ValleyWellModelQueryFilter
    on QueryBuilder<ValleyWellModel, ValleyWellModel, QFilterCondition> {
  QueryBuilder<ValleyWellModel, ValleyWellModel, QAfterFilterCondition>
      idEqualTo(Id value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<ValleyWellModel, ValleyWellModel, QAfterFilterCondition>
      idGreaterThan(
    Id value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<ValleyWellModel, ValleyWellModel, QAfterFilterCondition>
      idLessThan(
    Id value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<ValleyWellModel, ValleyWellModel, QAfterFilterCondition>
      idBetween(
    Id lower,
    Id upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'id',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<ValleyWellModel, ValleyWellModel, QAfterFilterCondition>
      questionEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'question',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ValleyWellModel, ValleyWellModel, QAfterFilterCondition>
      questionGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'question',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ValleyWellModel, ValleyWellModel, QAfterFilterCondition>
      questionLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'question',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ValleyWellModel, ValleyWellModel, QAfterFilterCondition>
      questionBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'question',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ValleyWellModel, ValleyWellModel, QAfterFilterCondition>
      questionStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'question',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ValleyWellModel, ValleyWellModel, QAfterFilterCondition>
      questionEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'question',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ValleyWellModel, ValleyWellModel, QAfterFilterCondition>
      questionContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'question',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ValleyWellModel, ValleyWellModel, QAfterFilterCondition>
      questionMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'question',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ValleyWellModel, ValleyWellModel, QAfterFilterCondition>
      questionIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'question',
        value: '',
      ));
    });
  }

  QueryBuilder<ValleyWellModel, ValleyWellModel, QAfterFilterCondition>
      questionIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'question',
        value: '',
      ));
    });
  }

  QueryBuilder<ValleyWellModel, ValleyWellModel, QAfterFilterCondition>
      questionAnswerIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'questionAnswer',
      ));
    });
  }

  QueryBuilder<ValleyWellModel, ValleyWellModel, QAfterFilterCondition>
      questionAnswerIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'questionAnswer',
      ));
    });
  }

  QueryBuilder<ValleyWellModel, ValleyWellModel, QAfterFilterCondition>
      questionAnswerEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'questionAnswer',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ValleyWellModel, ValleyWellModel, QAfterFilterCondition>
      questionAnswerGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'questionAnswer',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ValleyWellModel, ValleyWellModel, QAfterFilterCondition>
      questionAnswerLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'questionAnswer',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ValleyWellModel, ValleyWellModel, QAfterFilterCondition>
      questionAnswerBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'questionAnswer',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ValleyWellModel, ValleyWellModel, QAfterFilterCondition>
      questionAnswerStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'questionAnswer',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ValleyWellModel, ValleyWellModel, QAfterFilterCondition>
      questionAnswerEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'questionAnswer',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ValleyWellModel, ValleyWellModel, QAfterFilterCondition>
      questionAnswerContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'questionAnswer',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ValleyWellModel, ValleyWellModel, QAfterFilterCondition>
      questionAnswerMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'questionAnswer',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ValleyWellModel, ValleyWellModel, QAfterFilterCondition>
      questionAnswerIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'questionAnswer',
        value: '',
      ));
    });
  }

  QueryBuilder<ValleyWellModel, ValleyWellModel, QAfterFilterCondition>
      questionAnswerIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'questionAnswer',
        value: '',
      ));
    });
  }
}

extension ValleyWellModelQueryObject
    on QueryBuilder<ValleyWellModel, ValleyWellModel, QFilterCondition> {}

extension ValleyWellModelQueryLinks
    on QueryBuilder<ValleyWellModel, ValleyWellModel, QFilterCondition> {}

extension ValleyWellModelQuerySortBy
    on QueryBuilder<ValleyWellModel, ValleyWellModel, QSortBy> {
  QueryBuilder<ValleyWellModel, ValleyWellModel, QAfterSortBy>
      sortByQuestion() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'question', Sort.asc);
    });
  }

  QueryBuilder<ValleyWellModel, ValleyWellModel, QAfterSortBy>
      sortByQuestionDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'question', Sort.desc);
    });
  }

  QueryBuilder<ValleyWellModel, ValleyWellModel, QAfterSortBy>
      sortByQuestionAnswer() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'questionAnswer', Sort.asc);
    });
  }

  QueryBuilder<ValleyWellModel, ValleyWellModel, QAfterSortBy>
      sortByQuestionAnswerDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'questionAnswer', Sort.desc);
    });
  }
}

extension ValleyWellModelQuerySortThenBy
    on QueryBuilder<ValleyWellModel, ValleyWellModel, QSortThenBy> {
  QueryBuilder<ValleyWellModel, ValleyWellModel, QAfterSortBy> thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<ValleyWellModel, ValleyWellModel, QAfterSortBy> thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }

  QueryBuilder<ValleyWellModel, ValleyWellModel, QAfterSortBy>
      thenByQuestion() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'question', Sort.asc);
    });
  }

  QueryBuilder<ValleyWellModel, ValleyWellModel, QAfterSortBy>
      thenByQuestionDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'question', Sort.desc);
    });
  }

  QueryBuilder<ValleyWellModel, ValleyWellModel, QAfterSortBy>
      thenByQuestionAnswer() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'questionAnswer', Sort.asc);
    });
  }

  QueryBuilder<ValleyWellModel, ValleyWellModel, QAfterSortBy>
      thenByQuestionAnswerDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'questionAnswer', Sort.desc);
    });
  }
}

extension ValleyWellModelQueryWhereDistinct
    on QueryBuilder<ValleyWellModel, ValleyWellModel, QDistinct> {
  QueryBuilder<ValleyWellModel, ValleyWellModel, QDistinct> distinctByQuestion(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'question', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<ValleyWellModel, ValleyWellModel, QDistinct>
      distinctByQuestionAnswer({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'questionAnswer',
          caseSensitive: caseSensitive);
    });
  }
}

extension ValleyWellModelQueryProperty
    on QueryBuilder<ValleyWellModel, ValleyWellModel, QQueryProperty> {
  QueryBuilder<ValleyWellModel, int, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<ValleyWellModel, String, QQueryOperations> questionProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'question');
    });
  }

  QueryBuilder<ValleyWellModel, String?, QQueryOperations>
      questionAnswerProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'questionAnswer');
    });
  }
}
