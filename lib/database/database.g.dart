// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'database.dart';

// ignore_for_file: type=lint
class $UsersTable extends Users with TableInfo<$UsersTable, User> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $UsersTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('PRIMARY KEY AUTOINCREMENT'));
  static const VerificationMeta _nameMeta = const VerificationMeta('name');
  @override
  late final GeneratedColumn<String> name =
      GeneratedColumn<String>('name', aliasedName, false,
          additionalChecks: GeneratedColumn.checkTextLength(
            minTextLength: 3,
          ),
          type: DriftSqlType.string,
          requiredDuringInsert: true);
  static const VerificationMeta _lastNameMeta =
      const VerificationMeta('lastName');
  @override
  late final GeneratedColumn<String> lastName = GeneratedColumn<String>(
      'last_name', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _emailMeta = const VerificationMeta('email');
  @override
  late final GeneratedColumn<String> email = GeneratedColumn<String>(
      'email', aliasedName, false,
      type: DriftSqlType.string,
      requiredDuringInsert: true,
      defaultConstraints: GeneratedColumn.constraintIsAlways('UNIQUE'));
  static const VerificationMeta _activationCodeMeta =
      const VerificationMeta('activationCode');
  @override
  late final GeneratedColumn<String> activationCode = GeneratedColumn<String>(
      'activation_code', aliasedName, false,
      type: DriftSqlType.string,
      requiredDuringInsert: true,
      defaultConstraints: GeneratedColumn.constraintIsAlways('UNIQUE'));
  static const VerificationMeta _passwordMeta =
      const VerificationMeta('password');
  @override
  late final GeneratedColumn<String> password =
      GeneratedColumn<String>('password', aliasedName, false,
          additionalChecks: GeneratedColumn.checkTextLength(
            minTextLength: 6,
          ),
          type: DriftSqlType.string,
          requiredDuringInsert: true);
  static const VerificationMeta _refreshTokenMeta =
      const VerificationMeta('refreshToken');
  @override
  late final GeneratedColumn<String> refreshToken = GeneratedColumn<String>(
      'refresh_token', aliasedName, false,
      type: DriftSqlType.string,
      requiredDuringInsert: true,
      defaultConstraints: GeneratedColumn.constraintIsAlways('UNIQUE'));
  static const VerificationMeta _isActivatedMeta =
      const VerificationMeta('isActivated');
  @override
  late final GeneratedColumn<bool> isActivated = GeneratedColumn<bool>(
      'is_activated', aliasedName, false,
      type: DriftSqlType.bool,
      requiredDuringInsert: false,
      defaultValue: const Constant(false));
  static const VerificationMeta _createdAtMeta =
      const VerificationMeta('createdAt');
  @override
  late final GeneratedColumn<PgDateTime> createdAt =
      GeneratedColumn<PgDateTime>('created_at', aliasedName, false,
          type: PgTypes.timestampWithTimezone,
          requiredDuringInsert: false,
          defaultValue: const FunctionCallExpression('now', []));
  @override
  List<GeneratedColumn> get $columns => [
        id,
        name,
        lastName,
        email,
        activationCode,
        password,
        refreshToken,
        isActivated,
        createdAt
      ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'users';
  @override
  VerificationContext validateIntegrity(Insertable<User> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('name')) {
      context.handle(
          _nameMeta, name.isAcceptableOrUnknown(data['name']!, _nameMeta));
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    if (data.containsKey('last_name')) {
      context.handle(_lastNameMeta,
          lastName.isAcceptableOrUnknown(data['last_name']!, _lastNameMeta));
    } else if (isInserting) {
      context.missing(_lastNameMeta);
    }
    if (data.containsKey('email')) {
      context.handle(
          _emailMeta, email.isAcceptableOrUnknown(data['email']!, _emailMeta));
    } else if (isInserting) {
      context.missing(_emailMeta);
    }
    if (data.containsKey('activation_code')) {
      context.handle(
          _activationCodeMeta,
          activationCode.isAcceptableOrUnknown(
              data['activation_code']!, _activationCodeMeta));
    } else if (isInserting) {
      context.missing(_activationCodeMeta);
    }
    if (data.containsKey('password')) {
      context.handle(_passwordMeta,
          password.isAcceptableOrUnknown(data['password']!, _passwordMeta));
    } else if (isInserting) {
      context.missing(_passwordMeta);
    }
    if (data.containsKey('refresh_token')) {
      context.handle(
          _refreshTokenMeta,
          refreshToken.isAcceptableOrUnknown(
              data['refresh_token']!, _refreshTokenMeta));
    } else if (isInserting) {
      context.missing(_refreshTokenMeta);
    }
    if (data.containsKey('is_activated')) {
      context.handle(
          _isActivatedMeta,
          isActivated.isAcceptableOrUnknown(
              data['is_activated']!, _isActivatedMeta));
    }
    if (data.containsKey('created_at')) {
      context.handle(_createdAtMeta,
          createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  User map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return User(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      name: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}name'])!,
      lastName: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}last_name'])!,
      email: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}email'])!,
      activationCode: attachedDatabase.typeMapping.read(
          DriftSqlType.string, data['${effectivePrefix}activation_code'])!,
      password: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}password'])!,
      refreshToken: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}refresh_token'])!,
      isActivated: attachedDatabase.typeMapping
          .read(DriftSqlType.bool, data['${effectivePrefix}is_activated'])!,
      createdAt: attachedDatabase.typeMapping.read(
          PgTypes.timestampWithTimezone, data['${effectivePrefix}created_at'])!,
    );
  }

  @override
  $UsersTable createAlias(String alias) {
    return $UsersTable(attachedDatabase, alias);
  }
}

class User extends DataClass implements Insertable<User> {
  final int id;
  final String name;
  final String lastName;
  final String email;
  final String activationCode;
  final String password;
  final String refreshToken;
  final bool isActivated;
  final PgDateTime createdAt;
  const User(
      {required this.id,
      required this.name,
      required this.lastName,
      required this.email,
      required this.activationCode,
      required this.password,
      required this.refreshToken,
      required this.isActivated,
      required this.createdAt});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['name'] = Variable<String>(name);
    map['last_name'] = Variable<String>(lastName);
    map['email'] = Variable<String>(email);
    map['activation_code'] = Variable<String>(activationCode);
    map['password'] = Variable<String>(password);
    map['refresh_token'] = Variable<String>(refreshToken);
    map['is_activated'] = Variable<bool>(isActivated);
    map['created_at'] =
        Variable<PgDateTime>(createdAt, PgTypes.timestampWithTimezone);
    return map;
  }

  UsersCompanion toCompanion(bool nullToAbsent) {
    return UsersCompanion(
      id: Value(id),
      name: Value(name),
      lastName: Value(lastName),
      email: Value(email),
      activationCode: Value(activationCode),
      password: Value(password),
      refreshToken: Value(refreshToken),
      isActivated: Value(isActivated),
      createdAt: Value(createdAt),
    );
  }

  factory User.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return User(
      id: serializer.fromJson<int>(json['id']),
      name: serializer.fromJson<String>(json['name']),
      lastName: serializer.fromJson<String>(json['lastName']),
      email: serializer.fromJson<String>(json['email']),
      activationCode: serializer.fromJson<String>(json['activationCode']),
      password: serializer.fromJson<String>(json['password']),
      refreshToken: serializer.fromJson<String>(json['refreshToken']),
      isActivated: serializer.fromJson<bool>(json['isActivated']),
      createdAt: serializer.fromJson<PgDateTime>(json['createdAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'name': serializer.toJson<String>(name),
      'lastName': serializer.toJson<String>(lastName),
      'email': serializer.toJson<String>(email),
      'activationCode': serializer.toJson<String>(activationCode),
      'password': serializer.toJson<String>(password),
      'refreshToken': serializer.toJson<String>(refreshToken),
      'isActivated': serializer.toJson<bool>(isActivated),
      'createdAt': serializer.toJson<PgDateTime>(createdAt),
    };
  }

  User copyWith(
          {int? id,
          String? name,
          String? lastName,
          String? email,
          String? activationCode,
          String? password,
          String? refreshToken,
          bool? isActivated,
          PgDateTime? createdAt}) =>
      User(
        id: id ?? this.id,
        name: name ?? this.name,
        lastName: lastName ?? this.lastName,
        email: email ?? this.email,
        activationCode: activationCode ?? this.activationCode,
        password: password ?? this.password,
        refreshToken: refreshToken ?? this.refreshToken,
        isActivated: isActivated ?? this.isActivated,
        createdAt: createdAt ?? this.createdAt,
      );
  User copyWithCompanion(UsersCompanion data) {
    return User(
      id: data.id.present ? data.id.value : this.id,
      name: data.name.present ? data.name.value : this.name,
      lastName: data.lastName.present ? data.lastName.value : this.lastName,
      email: data.email.present ? data.email.value : this.email,
      activationCode: data.activationCode.present
          ? data.activationCode.value
          : this.activationCode,
      password: data.password.present ? data.password.value : this.password,
      refreshToken: data.refreshToken.present
          ? data.refreshToken.value
          : this.refreshToken,
      isActivated:
          data.isActivated.present ? data.isActivated.value : this.isActivated,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('User(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('lastName: $lastName, ')
          ..write('email: $email, ')
          ..write('activationCode: $activationCode, ')
          ..write('password: $password, ')
          ..write('refreshToken: $refreshToken, ')
          ..write('isActivated: $isActivated, ')
          ..write('createdAt: $createdAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, name, lastName, email, activationCode,
      password, refreshToken, isActivated, createdAt);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is User &&
          other.id == this.id &&
          other.name == this.name &&
          other.lastName == this.lastName &&
          other.email == this.email &&
          other.activationCode == this.activationCode &&
          other.password == this.password &&
          other.refreshToken == this.refreshToken &&
          other.isActivated == this.isActivated &&
          other.createdAt == this.createdAt);
}

class UsersCompanion extends UpdateCompanion<User> {
  final Value<int> id;
  final Value<String> name;
  final Value<String> lastName;
  final Value<String> email;
  final Value<String> activationCode;
  final Value<String> password;
  final Value<String> refreshToken;
  final Value<bool> isActivated;
  final Value<PgDateTime> createdAt;
  const UsersCompanion({
    this.id = const Value.absent(),
    this.name = const Value.absent(),
    this.lastName = const Value.absent(),
    this.email = const Value.absent(),
    this.activationCode = const Value.absent(),
    this.password = const Value.absent(),
    this.refreshToken = const Value.absent(),
    this.isActivated = const Value.absent(),
    this.createdAt = const Value.absent(),
  });
  UsersCompanion.insert({
    this.id = const Value.absent(),
    required String name,
    required String lastName,
    required String email,
    required String activationCode,
    required String password,
    required String refreshToken,
    this.isActivated = const Value.absent(),
    this.createdAt = const Value.absent(),
  })  : name = Value(name),
        lastName = Value(lastName),
        email = Value(email),
        activationCode = Value(activationCode),
        password = Value(password),
        refreshToken = Value(refreshToken);
  static Insertable<User> custom({
    Expression<int>? id,
    Expression<String>? name,
    Expression<String>? lastName,
    Expression<String>? email,
    Expression<String>? activationCode,
    Expression<String>? password,
    Expression<String>? refreshToken,
    Expression<bool>? isActivated,
    Expression<PgDateTime>? createdAt,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (name != null) 'name': name,
      if (lastName != null) 'last_name': lastName,
      if (email != null) 'email': email,
      if (activationCode != null) 'activation_code': activationCode,
      if (password != null) 'password': password,
      if (refreshToken != null) 'refresh_token': refreshToken,
      if (isActivated != null) 'is_activated': isActivated,
      if (createdAt != null) 'created_at': createdAt,
    });
  }

  UsersCompanion copyWith(
      {Value<int>? id,
      Value<String>? name,
      Value<String>? lastName,
      Value<String>? email,
      Value<String>? activationCode,
      Value<String>? password,
      Value<String>? refreshToken,
      Value<bool>? isActivated,
      Value<PgDateTime>? createdAt}) {
    return UsersCompanion(
      id: id ?? this.id,
      name: name ?? this.name,
      lastName: lastName ?? this.lastName,
      email: email ?? this.email,
      activationCode: activationCode ?? this.activationCode,
      password: password ?? this.password,
      refreshToken: refreshToken ?? this.refreshToken,
      isActivated: isActivated ?? this.isActivated,
      createdAt: createdAt ?? this.createdAt,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    if (lastName.present) {
      map['last_name'] = Variable<String>(lastName.value);
    }
    if (email.present) {
      map['email'] = Variable<String>(email.value);
    }
    if (activationCode.present) {
      map['activation_code'] = Variable<String>(activationCode.value);
    }
    if (password.present) {
      map['password'] = Variable<String>(password.value);
    }
    if (refreshToken.present) {
      map['refresh_token'] = Variable<String>(refreshToken.value);
    }
    if (isActivated.present) {
      map['is_activated'] = Variable<bool>(isActivated.value);
    }
    if (createdAt.present) {
      map['created_at'] =
          Variable<PgDateTime>(createdAt.value, PgTypes.timestampWithTimezone);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('UsersCompanion(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('lastName: $lastName, ')
          ..write('email: $email, ')
          ..write('activationCode: $activationCode, ')
          ..write('password: $password, ')
          ..write('refreshToken: $refreshToken, ')
          ..write('isActivated: $isActivated, ')
          ..write('createdAt: $createdAt')
          ..write(')'))
        .toString();
  }
}

class $TimetablesTable extends Timetables
    with TableInfo<$TimetablesTable, Timetable> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $TimetablesTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('PRIMARY KEY AUTOINCREMENT'));
  static const VerificationMeta _titleMeta = const VerificationMeta('title');
  @override
  late final GeneratedColumn<String> title =
      GeneratedColumn<String>('title', aliasedName, false,
          additionalChecks: GeneratedColumn.checkTextLength(
            minTextLength: 3,
          ),
          type: DriftSqlType.string,
          requiredDuringInsert: true);
  static const VerificationMeta _descriptionMeta =
      const VerificationMeta('description');
  @override
  late final GeneratedColumn<String> description = GeneratedColumn<String>(
      'description', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _invitationCodeMeta =
      const VerificationMeta('invitationCode');
  @override
  late final GeneratedColumn<String> invitationCode = GeneratedColumn<String>(
      'invitation_code', aliasedName, false,
      type: DriftSqlType.string,
      requiredDuringInsert: true,
      defaultConstraints: GeneratedColumn.constraintIsAlways('UNIQUE'));
  static const VerificationMeta _startTimeMeta =
      const VerificationMeta('startTime');
  @override
  late final GeneratedColumn<int> startTime = GeneratedColumn<int>(
      'start_time', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  static const VerificationMeta _endTimeMeta =
      const VerificationMeta('endTime');
  @override
  late final GeneratedColumn<int> endTime = GeneratedColumn<int>(
      'end_time', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  @override
  List<GeneratedColumn> get $columns =>
      [id, title, description, invitationCode, startTime, endTime];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'timetables';
  @override
  VerificationContext validateIntegrity(Insertable<Timetable> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('title')) {
      context.handle(
          _titleMeta, title.isAcceptableOrUnknown(data['title']!, _titleMeta));
    } else if (isInserting) {
      context.missing(_titleMeta);
    }
    if (data.containsKey('description')) {
      context.handle(
          _descriptionMeta,
          description.isAcceptableOrUnknown(
              data['description']!, _descriptionMeta));
    }
    if (data.containsKey('invitation_code')) {
      context.handle(
          _invitationCodeMeta,
          invitationCode.isAcceptableOrUnknown(
              data['invitation_code']!, _invitationCodeMeta));
    } else if (isInserting) {
      context.missing(_invitationCodeMeta);
    }
    if (data.containsKey('start_time')) {
      context.handle(_startTimeMeta,
          startTime.isAcceptableOrUnknown(data['start_time']!, _startTimeMeta));
    } else if (isInserting) {
      context.missing(_startTimeMeta);
    }
    if (data.containsKey('end_time')) {
      context.handle(_endTimeMeta,
          endTime.isAcceptableOrUnknown(data['end_time']!, _endTimeMeta));
    } else if (isInserting) {
      context.missing(_endTimeMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  Timetable map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return Timetable(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      title: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}title'])!,
      description: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}description']),
      invitationCode: attachedDatabase.typeMapping.read(
          DriftSqlType.string, data['${effectivePrefix}invitation_code'])!,
      startTime: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}start_time'])!,
      endTime: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}end_time'])!,
    );
  }

  @override
  $TimetablesTable createAlias(String alias) {
    return $TimetablesTable(attachedDatabase, alias);
  }
}

class Timetable extends DataClass implements Insertable<Timetable> {
  final int id;
  final String title;
  final String? description;
  final String invitationCode;
  final int startTime;
  final int endTime;
  const Timetable(
      {required this.id,
      required this.title,
      this.description,
      required this.invitationCode,
      required this.startTime,
      required this.endTime});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['title'] = Variable<String>(title);
    if (!nullToAbsent || description != null) {
      map['description'] = Variable<String>(description);
    }
    map['invitation_code'] = Variable<String>(invitationCode);
    map['start_time'] = Variable<int>(startTime);
    map['end_time'] = Variable<int>(endTime);
    return map;
  }

  TimetablesCompanion toCompanion(bool nullToAbsent) {
    return TimetablesCompanion(
      id: Value(id),
      title: Value(title),
      description: description == null && nullToAbsent
          ? const Value.absent()
          : Value(description),
      invitationCode: Value(invitationCode),
      startTime: Value(startTime),
      endTime: Value(endTime),
    );
  }

  factory Timetable.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Timetable(
      id: serializer.fromJson<int>(json['id']),
      title: serializer.fromJson<String>(json['title']),
      description: serializer.fromJson<String?>(json['description']),
      invitationCode: serializer.fromJson<String>(json['invitationCode']),
      startTime: serializer.fromJson<int>(json['startTime']),
      endTime: serializer.fromJson<int>(json['endTime']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'title': serializer.toJson<String>(title),
      'description': serializer.toJson<String?>(description),
      'invitationCode': serializer.toJson<String>(invitationCode),
      'startTime': serializer.toJson<int>(startTime),
      'endTime': serializer.toJson<int>(endTime),
    };
  }

  Timetable copyWith(
          {int? id,
          String? title,
          Value<String?> description = const Value.absent(),
          String? invitationCode,
          int? startTime,
          int? endTime}) =>
      Timetable(
        id: id ?? this.id,
        title: title ?? this.title,
        description: description.present ? description.value : this.description,
        invitationCode: invitationCode ?? this.invitationCode,
        startTime: startTime ?? this.startTime,
        endTime: endTime ?? this.endTime,
      );
  Timetable copyWithCompanion(TimetablesCompanion data) {
    return Timetable(
      id: data.id.present ? data.id.value : this.id,
      title: data.title.present ? data.title.value : this.title,
      description:
          data.description.present ? data.description.value : this.description,
      invitationCode: data.invitationCode.present
          ? data.invitationCode.value
          : this.invitationCode,
      startTime: data.startTime.present ? data.startTime.value : this.startTime,
      endTime: data.endTime.present ? data.endTime.value : this.endTime,
    );
  }

  @override
  String toString() {
    return (StringBuffer('Timetable(')
          ..write('id: $id, ')
          ..write('title: $title, ')
          ..write('description: $description, ')
          ..write('invitationCode: $invitationCode, ')
          ..write('startTime: $startTime, ')
          ..write('endTime: $endTime')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode =>
      Object.hash(id, title, description, invitationCode, startTime, endTime);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Timetable &&
          other.id == this.id &&
          other.title == this.title &&
          other.description == this.description &&
          other.invitationCode == this.invitationCode &&
          other.startTime == this.startTime &&
          other.endTime == this.endTime);
}

class TimetablesCompanion extends UpdateCompanion<Timetable> {
  final Value<int> id;
  final Value<String> title;
  final Value<String?> description;
  final Value<String> invitationCode;
  final Value<int> startTime;
  final Value<int> endTime;
  const TimetablesCompanion({
    this.id = const Value.absent(),
    this.title = const Value.absent(),
    this.description = const Value.absent(),
    this.invitationCode = const Value.absent(),
    this.startTime = const Value.absent(),
    this.endTime = const Value.absent(),
  });
  TimetablesCompanion.insert({
    this.id = const Value.absent(),
    required String title,
    this.description = const Value.absent(),
    required String invitationCode,
    required int startTime,
    required int endTime,
  })  : title = Value(title),
        invitationCode = Value(invitationCode),
        startTime = Value(startTime),
        endTime = Value(endTime);
  static Insertable<Timetable> custom({
    Expression<int>? id,
    Expression<String>? title,
    Expression<String>? description,
    Expression<String>? invitationCode,
    Expression<int>? startTime,
    Expression<int>? endTime,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (title != null) 'title': title,
      if (description != null) 'description': description,
      if (invitationCode != null) 'invitation_code': invitationCode,
      if (startTime != null) 'start_time': startTime,
      if (endTime != null) 'end_time': endTime,
    });
  }

  TimetablesCompanion copyWith(
      {Value<int>? id,
      Value<String>? title,
      Value<String?>? description,
      Value<String>? invitationCode,
      Value<int>? startTime,
      Value<int>? endTime}) {
    return TimetablesCompanion(
      id: id ?? this.id,
      title: title ?? this.title,
      description: description ?? this.description,
      invitationCode: invitationCode ?? this.invitationCode,
      startTime: startTime ?? this.startTime,
      endTime: endTime ?? this.endTime,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (title.present) {
      map['title'] = Variable<String>(title.value);
    }
    if (description.present) {
      map['description'] = Variable<String>(description.value);
    }
    if (invitationCode.present) {
      map['invitation_code'] = Variable<String>(invitationCode.value);
    }
    if (startTime.present) {
      map['start_time'] = Variable<int>(startTime.value);
    }
    if (endTime.present) {
      map['end_time'] = Variable<int>(endTime.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('TimetablesCompanion(')
          ..write('id: $id, ')
          ..write('title: $title, ')
          ..write('description: $description, ')
          ..write('invitationCode: $invitationCode, ')
          ..write('startTime: $startTime, ')
          ..write('endTime: $endTime')
          ..write(')'))
        .toString();
  }
}

class $EventsTable extends Events with TableInfo<$EventsTable, Event> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $EventsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('PRIMARY KEY AUTOINCREMENT'));
  static const VerificationMeta _timetableIdMeta =
      const VerificationMeta('timetableId');
  @override
  late final GeneratedColumn<int> timetableId = GeneratedColumn<int>(
      'timetable_id', aliasedName, false,
      type: DriftSqlType.int,
      requiredDuringInsert: true,
      defaultConstraints: GeneratedColumn.constraintIsAlways(
          'REFERENCES timetables (id) ON DELETE CASCADE'));
  static const VerificationMeta _titleMeta = const VerificationMeta('title');
  @override
  late final GeneratedColumn<String> title = GeneratedColumn<String>(
      'title', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _descriptionMeta =
      const VerificationMeta('description');
  @override
  late final GeneratedColumn<String> description = GeneratedColumn<String>(
      'description', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _dayMeta = const VerificationMeta('day');
  @override
  late final GeneratedColumn<int> day = GeneratedColumn<int>(
      'day', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  static const VerificationMeta _startTimeMeta =
      const VerificationMeta('startTime');
  @override
  late final GeneratedColumn<int> startTime = GeneratedColumn<int>(
      'start_time', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  static const VerificationMeta _endTimeMeta =
      const VerificationMeta('endTime');
  @override
  late final GeneratedColumn<int> endTime = GeneratedColumn<int>(
      'end_time', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  @override
  List<GeneratedColumn> get $columns =>
      [id, timetableId, title, description, day, startTime, endTime];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'events';
  @override
  VerificationContext validateIntegrity(Insertable<Event> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('timetable_id')) {
      context.handle(
          _timetableIdMeta,
          timetableId.isAcceptableOrUnknown(
              data['timetable_id']!, _timetableIdMeta));
    } else if (isInserting) {
      context.missing(_timetableIdMeta);
    }
    if (data.containsKey('title')) {
      context.handle(
          _titleMeta, title.isAcceptableOrUnknown(data['title']!, _titleMeta));
    } else if (isInserting) {
      context.missing(_titleMeta);
    }
    if (data.containsKey('description')) {
      context.handle(
          _descriptionMeta,
          description.isAcceptableOrUnknown(
              data['description']!, _descriptionMeta));
    }
    if (data.containsKey('day')) {
      context.handle(
          _dayMeta, day.isAcceptableOrUnknown(data['day']!, _dayMeta));
    } else if (isInserting) {
      context.missing(_dayMeta);
    }
    if (data.containsKey('start_time')) {
      context.handle(_startTimeMeta,
          startTime.isAcceptableOrUnknown(data['start_time']!, _startTimeMeta));
    } else if (isInserting) {
      context.missing(_startTimeMeta);
    }
    if (data.containsKey('end_time')) {
      context.handle(_endTimeMeta,
          endTime.isAcceptableOrUnknown(data['end_time']!, _endTimeMeta));
    } else if (isInserting) {
      context.missing(_endTimeMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  Event map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return Event(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      timetableId: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}timetable_id'])!,
      title: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}title'])!,
      description: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}description']),
      day: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}day'])!,
      startTime: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}start_time'])!,
      endTime: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}end_time'])!,
    );
  }

  @override
  $EventsTable createAlias(String alias) {
    return $EventsTable(attachedDatabase, alias);
  }
}

class Event extends DataClass implements Insertable<Event> {
  final int id;
  final int timetableId;
  final String title;
  final String? description;
  final int day;
  final int startTime;
  final int endTime;
  const Event(
      {required this.id,
      required this.timetableId,
      required this.title,
      this.description,
      required this.day,
      required this.startTime,
      required this.endTime});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['timetable_id'] = Variable<int>(timetableId);
    map['title'] = Variable<String>(title);
    if (!nullToAbsent || description != null) {
      map['description'] = Variable<String>(description);
    }
    map['day'] = Variable<int>(day);
    map['start_time'] = Variable<int>(startTime);
    map['end_time'] = Variable<int>(endTime);
    return map;
  }

  EventsCompanion toCompanion(bool nullToAbsent) {
    return EventsCompanion(
      id: Value(id),
      timetableId: Value(timetableId),
      title: Value(title),
      description: description == null && nullToAbsent
          ? const Value.absent()
          : Value(description),
      day: Value(day),
      startTime: Value(startTime),
      endTime: Value(endTime),
    );
  }

  factory Event.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Event(
      id: serializer.fromJson<int>(json['id']),
      timetableId: serializer.fromJson<int>(json['timetableId']),
      title: serializer.fromJson<String>(json['title']),
      description: serializer.fromJson<String?>(json['description']),
      day: serializer.fromJson<int>(json['day']),
      startTime: serializer.fromJson<int>(json['startTime']),
      endTime: serializer.fromJson<int>(json['endTime']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'timetableId': serializer.toJson<int>(timetableId),
      'title': serializer.toJson<String>(title),
      'description': serializer.toJson<String?>(description),
      'day': serializer.toJson<int>(day),
      'startTime': serializer.toJson<int>(startTime),
      'endTime': serializer.toJson<int>(endTime),
    };
  }

  Event copyWith(
          {int? id,
          int? timetableId,
          String? title,
          Value<String?> description = const Value.absent(),
          int? day,
          int? startTime,
          int? endTime}) =>
      Event(
        id: id ?? this.id,
        timetableId: timetableId ?? this.timetableId,
        title: title ?? this.title,
        description: description.present ? description.value : this.description,
        day: day ?? this.day,
        startTime: startTime ?? this.startTime,
        endTime: endTime ?? this.endTime,
      );
  Event copyWithCompanion(EventsCompanion data) {
    return Event(
      id: data.id.present ? data.id.value : this.id,
      timetableId:
          data.timetableId.present ? data.timetableId.value : this.timetableId,
      title: data.title.present ? data.title.value : this.title,
      description:
          data.description.present ? data.description.value : this.description,
      day: data.day.present ? data.day.value : this.day,
      startTime: data.startTime.present ? data.startTime.value : this.startTime,
      endTime: data.endTime.present ? data.endTime.value : this.endTime,
    );
  }

  @override
  String toString() {
    return (StringBuffer('Event(')
          ..write('id: $id, ')
          ..write('timetableId: $timetableId, ')
          ..write('title: $title, ')
          ..write('description: $description, ')
          ..write('day: $day, ')
          ..write('startTime: $startTime, ')
          ..write('endTime: $endTime')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode =>
      Object.hash(id, timetableId, title, description, day, startTime, endTime);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Event &&
          other.id == this.id &&
          other.timetableId == this.timetableId &&
          other.title == this.title &&
          other.description == this.description &&
          other.day == this.day &&
          other.startTime == this.startTime &&
          other.endTime == this.endTime);
}

class EventsCompanion extends UpdateCompanion<Event> {
  final Value<int> id;
  final Value<int> timetableId;
  final Value<String> title;
  final Value<String?> description;
  final Value<int> day;
  final Value<int> startTime;
  final Value<int> endTime;
  const EventsCompanion({
    this.id = const Value.absent(),
    this.timetableId = const Value.absent(),
    this.title = const Value.absent(),
    this.description = const Value.absent(),
    this.day = const Value.absent(),
    this.startTime = const Value.absent(),
    this.endTime = const Value.absent(),
  });
  EventsCompanion.insert({
    this.id = const Value.absent(),
    required int timetableId,
    required String title,
    this.description = const Value.absent(),
    required int day,
    required int startTime,
    required int endTime,
  })  : timetableId = Value(timetableId),
        title = Value(title),
        day = Value(day),
        startTime = Value(startTime),
        endTime = Value(endTime);
  static Insertable<Event> custom({
    Expression<int>? id,
    Expression<int>? timetableId,
    Expression<String>? title,
    Expression<String>? description,
    Expression<int>? day,
    Expression<int>? startTime,
    Expression<int>? endTime,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (timetableId != null) 'timetable_id': timetableId,
      if (title != null) 'title': title,
      if (description != null) 'description': description,
      if (day != null) 'day': day,
      if (startTime != null) 'start_time': startTime,
      if (endTime != null) 'end_time': endTime,
    });
  }

  EventsCompanion copyWith(
      {Value<int>? id,
      Value<int>? timetableId,
      Value<String>? title,
      Value<String?>? description,
      Value<int>? day,
      Value<int>? startTime,
      Value<int>? endTime}) {
    return EventsCompanion(
      id: id ?? this.id,
      timetableId: timetableId ?? this.timetableId,
      title: title ?? this.title,
      description: description ?? this.description,
      day: day ?? this.day,
      startTime: startTime ?? this.startTime,
      endTime: endTime ?? this.endTime,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (timetableId.present) {
      map['timetable_id'] = Variable<int>(timetableId.value);
    }
    if (title.present) {
      map['title'] = Variable<String>(title.value);
    }
    if (description.present) {
      map['description'] = Variable<String>(description.value);
    }
    if (day.present) {
      map['day'] = Variable<int>(day.value);
    }
    if (startTime.present) {
      map['start_time'] = Variable<int>(startTime.value);
    }
    if (endTime.present) {
      map['end_time'] = Variable<int>(endTime.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('EventsCompanion(')
          ..write('id: $id, ')
          ..write('timetableId: $timetableId, ')
          ..write('title: $title, ')
          ..write('description: $description, ')
          ..write('day: $day, ')
          ..write('startTime: $startTime, ')
          ..write('endTime: $endTime')
          ..write(')'))
        .toString();
  }
}

class $TimetableMembersTable extends TimetableMembers
    with TableInfo<$TimetableMembersTable, TimetableMember> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $TimetableMembersTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('PRIMARY KEY AUTOINCREMENT'));
  static const VerificationMeta _userIdMeta = const VerificationMeta('userId');
  @override
  late final GeneratedColumn<int> userId = GeneratedColumn<int>(
      'user_id', aliasedName, false,
      type: DriftSqlType.int,
      requiredDuringInsert: true,
      defaultConstraints: GeneratedColumn.constraintIsAlways(
          'REFERENCES users (id) ON DELETE CASCADE'));
  static const VerificationMeta _timetableIdMeta =
      const VerificationMeta('timetableId');
  @override
  late final GeneratedColumn<int> timetableId = GeneratedColumn<int>(
      'timetable_id', aliasedName, false,
      type: DriftSqlType.int,
      requiredDuringInsert: true,
      defaultConstraints: GeneratedColumn.constraintIsAlways(
          'REFERENCES timetables (id) ON DELETE CASCADE'));
  static const VerificationMeta _roleMeta = const VerificationMeta('role');
  @override
  late final GeneratedColumnWithTypeConverter<TimetableMemberRoles, String>
      role = GeneratedColumn<String>('role', aliasedName, false,
              type: DriftSqlType.string,
              requiredDuringInsert: false,
              defaultValue: Constant(TimetableMemberRoles.member.name))
          .withConverter<TimetableMemberRoles>(
              $TimetableMembersTable.$converterrole);
  @override
  List<GeneratedColumn> get $columns => [id, userId, timetableId, role];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'timetable_members';
  @override
  VerificationContext validateIntegrity(Insertable<TimetableMember> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('user_id')) {
      context.handle(_userIdMeta,
          userId.isAcceptableOrUnknown(data['user_id']!, _userIdMeta));
    } else if (isInserting) {
      context.missing(_userIdMeta);
    }
    if (data.containsKey('timetable_id')) {
      context.handle(
          _timetableIdMeta,
          timetableId.isAcceptableOrUnknown(
              data['timetable_id']!, _timetableIdMeta));
    } else if (isInserting) {
      context.missing(_timetableIdMeta);
    }
    context.handle(_roleMeta, const VerificationResult.success());
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  List<Set<GeneratedColumn>> get uniqueKeys => [
        {userId, timetableId},
      ];
  @override
  TimetableMember map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return TimetableMember(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      userId: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}user_id'])!,
      timetableId: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}timetable_id'])!,
      role: $TimetableMembersTable.$converterrole.fromSql(attachedDatabase
          .typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}role'])!),
    );
  }

  @override
  $TimetableMembersTable createAlias(String alias) {
    return $TimetableMembersTable(attachedDatabase, alias);
  }

  static JsonTypeConverter2<TimetableMemberRoles, String, String>
      $converterrole = const EnumNameConverter<TimetableMemberRoles>(
          TimetableMemberRoles.values);
}

class TimetableMember extends DataClass implements Insertable<TimetableMember> {
  final int id;
  final int userId;
  final int timetableId;
  final TimetableMemberRoles role;
  const TimetableMember(
      {required this.id,
      required this.userId,
      required this.timetableId,
      required this.role});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['user_id'] = Variable<int>(userId);
    map['timetable_id'] = Variable<int>(timetableId);
    {
      map['role'] =
          Variable<String>($TimetableMembersTable.$converterrole.toSql(role));
    }
    return map;
  }

  TimetableMembersCompanion toCompanion(bool nullToAbsent) {
    return TimetableMembersCompanion(
      id: Value(id),
      userId: Value(userId),
      timetableId: Value(timetableId),
      role: Value(role),
    );
  }

  factory TimetableMember.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return TimetableMember(
      id: serializer.fromJson<int>(json['id']),
      userId: serializer.fromJson<int>(json['userId']),
      timetableId: serializer.fromJson<int>(json['timetableId']),
      role: $TimetableMembersTable.$converterrole
          .fromJson(serializer.fromJson<String>(json['role'])),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'userId': serializer.toJson<int>(userId),
      'timetableId': serializer.toJson<int>(timetableId),
      'role': serializer
          .toJson<String>($TimetableMembersTable.$converterrole.toJson(role)),
    };
  }

  TimetableMember copyWith(
          {int? id,
          int? userId,
          int? timetableId,
          TimetableMemberRoles? role}) =>
      TimetableMember(
        id: id ?? this.id,
        userId: userId ?? this.userId,
        timetableId: timetableId ?? this.timetableId,
        role: role ?? this.role,
      );
  TimetableMember copyWithCompanion(TimetableMembersCompanion data) {
    return TimetableMember(
      id: data.id.present ? data.id.value : this.id,
      userId: data.userId.present ? data.userId.value : this.userId,
      timetableId:
          data.timetableId.present ? data.timetableId.value : this.timetableId,
      role: data.role.present ? data.role.value : this.role,
    );
  }

  @override
  String toString() {
    return (StringBuffer('TimetableMember(')
          ..write('id: $id, ')
          ..write('userId: $userId, ')
          ..write('timetableId: $timetableId, ')
          ..write('role: $role')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, userId, timetableId, role);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is TimetableMember &&
          other.id == this.id &&
          other.userId == this.userId &&
          other.timetableId == this.timetableId &&
          other.role == this.role);
}

class TimetableMembersCompanion extends UpdateCompanion<TimetableMember> {
  final Value<int> id;
  final Value<int> userId;
  final Value<int> timetableId;
  final Value<TimetableMemberRoles> role;
  const TimetableMembersCompanion({
    this.id = const Value.absent(),
    this.userId = const Value.absent(),
    this.timetableId = const Value.absent(),
    this.role = const Value.absent(),
  });
  TimetableMembersCompanion.insert({
    this.id = const Value.absent(),
    required int userId,
    required int timetableId,
    this.role = const Value.absent(),
  })  : userId = Value(userId),
        timetableId = Value(timetableId);
  static Insertable<TimetableMember> custom({
    Expression<int>? id,
    Expression<int>? userId,
    Expression<int>? timetableId,
    Expression<String>? role,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (userId != null) 'user_id': userId,
      if (timetableId != null) 'timetable_id': timetableId,
      if (role != null) 'role': role,
    });
  }

  TimetableMembersCompanion copyWith(
      {Value<int>? id,
      Value<int>? userId,
      Value<int>? timetableId,
      Value<TimetableMemberRoles>? role}) {
    return TimetableMembersCompanion(
      id: id ?? this.id,
      userId: userId ?? this.userId,
      timetableId: timetableId ?? this.timetableId,
      role: role ?? this.role,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (userId.present) {
      map['user_id'] = Variable<int>(userId.value);
    }
    if (timetableId.present) {
      map['timetable_id'] = Variable<int>(timetableId.value);
    }
    if (role.present) {
      map['role'] = Variable<String>(
          $TimetableMembersTable.$converterrole.toSql(role.value));
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('TimetableMembersCompanion(')
          ..write('id: $id, ')
          ..write('userId: $userId, ')
          ..write('timetableId: $timetableId, ')
          ..write('role: $role')
          ..write(')'))
        .toString();
  }
}

class $EventHostsTable extends EventHosts
    with TableInfo<$EventHostsTable, EventHost> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $EventHostsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('PRIMARY KEY AUTOINCREMENT'));
  static const VerificationMeta _memberIdMeta =
      const VerificationMeta('memberId');
  @override
  late final GeneratedColumn<int> memberId = GeneratedColumn<int>(
      'member_id', aliasedName, false,
      type: DriftSqlType.int,
      requiredDuringInsert: true,
      defaultConstraints: GeneratedColumn.constraintIsAlways(
          'REFERENCES timetable_members (id) ON DELETE CASCADE'));
  static const VerificationMeta _eventIdMeta =
      const VerificationMeta('eventId');
  @override
  late final GeneratedColumn<int> eventId = GeneratedColumn<int>(
      'event_id', aliasedName, false,
      type: DriftSqlType.int,
      requiredDuringInsert: true,
      defaultConstraints: GeneratedColumn.constraintIsAlways(
          'REFERENCES events (id) ON DELETE CASCADE'));
  @override
  List<GeneratedColumn> get $columns => [id, memberId, eventId];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'event_hosts';
  @override
  VerificationContext validateIntegrity(Insertable<EventHost> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('member_id')) {
      context.handle(_memberIdMeta,
          memberId.isAcceptableOrUnknown(data['member_id']!, _memberIdMeta));
    } else if (isInserting) {
      context.missing(_memberIdMeta);
    }
    if (data.containsKey('event_id')) {
      context.handle(_eventIdMeta,
          eventId.isAcceptableOrUnknown(data['event_id']!, _eventIdMeta));
    } else if (isInserting) {
      context.missing(_eventIdMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  List<Set<GeneratedColumn>> get uniqueKeys => [
        {memberId, eventId},
      ];
  @override
  EventHost map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return EventHost(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      memberId: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}member_id'])!,
      eventId: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}event_id'])!,
    );
  }

  @override
  $EventHostsTable createAlias(String alias) {
    return $EventHostsTable(attachedDatabase, alias);
  }
}

class EventHost extends DataClass implements Insertable<EventHost> {
  final int id;
  final int memberId;
  final int eventId;
  const EventHost(
      {required this.id, required this.memberId, required this.eventId});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['member_id'] = Variable<int>(memberId);
    map['event_id'] = Variable<int>(eventId);
    return map;
  }

  EventHostsCompanion toCompanion(bool nullToAbsent) {
    return EventHostsCompanion(
      id: Value(id),
      memberId: Value(memberId),
      eventId: Value(eventId),
    );
  }

  factory EventHost.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return EventHost(
      id: serializer.fromJson<int>(json['id']),
      memberId: serializer.fromJson<int>(json['memberId']),
      eventId: serializer.fromJson<int>(json['eventId']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'memberId': serializer.toJson<int>(memberId),
      'eventId': serializer.toJson<int>(eventId),
    };
  }

  EventHost copyWith({int? id, int? memberId, int? eventId}) => EventHost(
        id: id ?? this.id,
        memberId: memberId ?? this.memberId,
        eventId: eventId ?? this.eventId,
      );
  EventHost copyWithCompanion(EventHostsCompanion data) {
    return EventHost(
      id: data.id.present ? data.id.value : this.id,
      memberId: data.memberId.present ? data.memberId.value : this.memberId,
      eventId: data.eventId.present ? data.eventId.value : this.eventId,
    );
  }

  @override
  String toString() {
    return (StringBuffer('EventHost(')
          ..write('id: $id, ')
          ..write('memberId: $memberId, ')
          ..write('eventId: $eventId')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, memberId, eventId);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is EventHost &&
          other.id == this.id &&
          other.memberId == this.memberId &&
          other.eventId == this.eventId);
}

class EventHostsCompanion extends UpdateCompanion<EventHost> {
  final Value<int> id;
  final Value<int> memberId;
  final Value<int> eventId;
  const EventHostsCompanion({
    this.id = const Value.absent(),
    this.memberId = const Value.absent(),
    this.eventId = const Value.absent(),
  });
  EventHostsCompanion.insert({
    this.id = const Value.absent(),
    required int memberId,
    required int eventId,
  })  : memberId = Value(memberId),
        eventId = Value(eventId);
  static Insertable<EventHost> custom({
    Expression<int>? id,
    Expression<int>? memberId,
    Expression<int>? eventId,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (memberId != null) 'member_id': memberId,
      if (eventId != null) 'event_id': eventId,
    });
  }

  EventHostsCompanion copyWith(
      {Value<int>? id, Value<int>? memberId, Value<int>? eventId}) {
    return EventHostsCompanion(
      id: id ?? this.id,
      memberId: memberId ?? this.memberId,
      eventId: eventId ?? this.eventId,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (memberId.present) {
      map['member_id'] = Variable<int>(memberId.value);
    }
    if (eventId.present) {
      map['event_id'] = Variable<int>(eventId.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('EventHostsCompanion(')
          ..write('id: $id, ')
          ..write('memberId: $memberId, ')
          ..write('eventId: $eventId')
          ..write(')'))
        .toString();
  }
}

abstract class _$Database extends GeneratedDatabase {
  _$Database(QueryExecutor e) : super(e);
  $DatabaseManager get managers => $DatabaseManager(this);
  late final $UsersTable users = $UsersTable(this);
  late final $TimetablesTable timetables = $TimetablesTable(this);
  late final $EventsTable events = $EventsTable(this);
  late final $TimetableMembersTable timetableMembers =
      $TimetableMembersTable(this);
  late final $EventHostsTable eventHosts = $EventHostsTable(this);
  @override
  Iterable<TableInfo<Table, Object?>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities =>
      [users, timetables, events, timetableMembers, eventHosts];
  @override
  StreamQueryUpdateRules get streamUpdateRules => const StreamQueryUpdateRules(
        [
          WritePropagation(
            on: TableUpdateQuery.onTableName('timetables',
                limitUpdateKind: UpdateKind.delete),
            result: [
              TableUpdate('events', kind: UpdateKind.delete),
            ],
          ),
          WritePropagation(
            on: TableUpdateQuery.onTableName('users',
                limitUpdateKind: UpdateKind.delete),
            result: [
              TableUpdate('timetable_members', kind: UpdateKind.delete),
            ],
          ),
          WritePropagation(
            on: TableUpdateQuery.onTableName('timetables',
                limitUpdateKind: UpdateKind.delete),
            result: [
              TableUpdate('timetable_members', kind: UpdateKind.delete),
            ],
          ),
          WritePropagation(
            on: TableUpdateQuery.onTableName('timetable_members',
                limitUpdateKind: UpdateKind.delete),
            result: [
              TableUpdate('event_hosts', kind: UpdateKind.delete),
            ],
          ),
          WritePropagation(
            on: TableUpdateQuery.onTableName('events',
                limitUpdateKind: UpdateKind.delete),
            result: [
              TableUpdate('event_hosts', kind: UpdateKind.delete),
            ],
          ),
        ],
      );
}

typedef $$UsersTableCreateCompanionBuilder = UsersCompanion Function({
  Value<int> id,
  required String name,
  required String lastName,
  required String email,
  required String activationCode,
  required String password,
  required String refreshToken,
  Value<bool> isActivated,
  Value<PgDateTime> createdAt,
});
typedef $$UsersTableUpdateCompanionBuilder = UsersCompanion Function({
  Value<int> id,
  Value<String> name,
  Value<String> lastName,
  Value<String> email,
  Value<String> activationCode,
  Value<String> password,
  Value<String> refreshToken,
  Value<bool> isActivated,
  Value<PgDateTime> createdAt,
});

final class $$UsersTableReferences
    extends BaseReferences<_$Database, $UsersTable, User> {
  $$UsersTableReferences(super.$_db, super.$_table, super.$_typedResult);

  static MultiTypedResultKey<$TimetableMembersTable, List<TimetableMember>>
      _membersToUsersTable(_$Database db) => MultiTypedResultKey.fromTable(
          db.timetableMembers,
          aliasName:
              $_aliasNameGenerator(db.users.id, db.timetableMembers.userId));

  $$TimetableMembersTableProcessedTableManager get membersToUsers {
    final manager =
        $$TimetableMembersTableTableManager($_db, $_db.timetableMembers)
            .filter((f) => f.userId.id($_item.id));

    final cache = $_typedResult.readTableOrNull(_membersToUsersTable($_db));
    return ProcessedTableManager(
        manager.$state.copyWith(prefetchedData: cache));
  }
}

class $$UsersTableFilterComposer extends Composer<_$Database, $UsersTable> {
  $$UsersTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get name => $composableBuilder(
      column: $table.name, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get lastName => $composableBuilder(
      column: $table.lastName, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get email => $composableBuilder(
      column: $table.email, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get activationCode => $composableBuilder(
      column: $table.activationCode,
      builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get password => $composableBuilder(
      column: $table.password, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get refreshToken => $composableBuilder(
      column: $table.refreshToken, builder: (column) => ColumnFilters(column));

  ColumnFilters<bool> get isActivated => $composableBuilder(
      column: $table.isActivated, builder: (column) => ColumnFilters(column));

  ColumnFilters<PgDateTime> get createdAt => $composableBuilder(
      column: $table.createdAt, builder: (column) => ColumnFilters(column));

  Expression<bool> membersToUsers(
      Expression<bool> Function($$TimetableMembersTableFilterComposer f) f) {
    final $$TimetableMembersTableFilterComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.id,
        referencedTable: $db.timetableMembers,
        getReferencedColumn: (t) => t.userId,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$TimetableMembersTableFilterComposer(
              $db: $db,
              $table: $db.timetableMembers,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return f(composer);
  }
}

class $$UsersTableOrderingComposer extends Composer<_$Database, $UsersTable> {
  $$UsersTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get name => $composableBuilder(
      column: $table.name, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get lastName => $composableBuilder(
      column: $table.lastName, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get email => $composableBuilder(
      column: $table.email, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get activationCode => $composableBuilder(
      column: $table.activationCode,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get password => $composableBuilder(
      column: $table.password, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get refreshToken => $composableBuilder(
      column: $table.refreshToken,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<bool> get isActivated => $composableBuilder(
      column: $table.isActivated, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<PgDateTime> get createdAt => $composableBuilder(
      column: $table.createdAt, builder: (column) => ColumnOrderings(column));
}

class $$UsersTableAnnotationComposer extends Composer<_$Database, $UsersTable> {
  $$UsersTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get name =>
      $composableBuilder(column: $table.name, builder: (column) => column);

  GeneratedColumn<String> get lastName =>
      $composableBuilder(column: $table.lastName, builder: (column) => column);

  GeneratedColumn<String> get email =>
      $composableBuilder(column: $table.email, builder: (column) => column);

  GeneratedColumn<String> get activationCode => $composableBuilder(
      column: $table.activationCode, builder: (column) => column);

  GeneratedColumn<String> get password =>
      $composableBuilder(column: $table.password, builder: (column) => column);

  GeneratedColumn<String> get refreshToken => $composableBuilder(
      column: $table.refreshToken, builder: (column) => column);

  GeneratedColumn<bool> get isActivated => $composableBuilder(
      column: $table.isActivated, builder: (column) => column);

  GeneratedColumn<PgDateTime> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);

  Expression<T> membersToUsers<T extends Object>(
      Expression<T> Function($$TimetableMembersTableAnnotationComposer a) f) {
    final $$TimetableMembersTableAnnotationComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.id,
        referencedTable: $db.timetableMembers,
        getReferencedColumn: (t) => t.userId,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$TimetableMembersTableAnnotationComposer(
              $db: $db,
              $table: $db.timetableMembers,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return f(composer);
  }
}

class $$UsersTableTableManager extends RootTableManager<
    _$Database,
    $UsersTable,
    User,
    $$UsersTableFilterComposer,
    $$UsersTableOrderingComposer,
    $$UsersTableAnnotationComposer,
    $$UsersTableCreateCompanionBuilder,
    $$UsersTableUpdateCompanionBuilder,
    (User, $$UsersTableReferences),
    User,
    PrefetchHooks Function({bool membersToUsers})> {
  $$UsersTableTableManager(_$Database db, $UsersTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$UsersTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$UsersTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$UsersTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback: ({
            Value<int> id = const Value.absent(),
            Value<String> name = const Value.absent(),
            Value<String> lastName = const Value.absent(),
            Value<String> email = const Value.absent(),
            Value<String> activationCode = const Value.absent(),
            Value<String> password = const Value.absent(),
            Value<String> refreshToken = const Value.absent(),
            Value<bool> isActivated = const Value.absent(),
            Value<PgDateTime> createdAt = const Value.absent(),
          }) =>
              UsersCompanion(
            id: id,
            name: name,
            lastName: lastName,
            email: email,
            activationCode: activationCode,
            password: password,
            refreshToken: refreshToken,
            isActivated: isActivated,
            createdAt: createdAt,
          ),
          createCompanionCallback: ({
            Value<int> id = const Value.absent(),
            required String name,
            required String lastName,
            required String email,
            required String activationCode,
            required String password,
            required String refreshToken,
            Value<bool> isActivated = const Value.absent(),
            Value<PgDateTime> createdAt = const Value.absent(),
          }) =>
              UsersCompanion.insert(
            id: id,
            name: name,
            lastName: lastName,
            email: email,
            activationCode: activationCode,
            password: password,
            refreshToken: refreshToken,
            isActivated: isActivated,
            createdAt: createdAt,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) =>
                  (e.readTable(table), $$UsersTableReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: ({membersToUsers = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [
                if (membersToUsers) db.timetableMembers
              ],
              addJoins: null,
              getPrefetchedDataCallback: (items) async {
                return [
                  if (membersToUsers)
                    await $_getPrefetchedData(
                        currentTable: table,
                        referencedTable:
                            $$UsersTableReferences._membersToUsersTable(db),
                        managerFromTypedResult: (p0) =>
                            $$UsersTableReferences(db, table, p0)
                                .membersToUsers,
                        referencedItemsForCurrentItem: (item,
                                referencedItems) =>
                            referencedItems.where((e) => e.userId == item.id),
                        typedResults: items)
                ];
              },
            );
          },
        ));
}

typedef $$UsersTableProcessedTableManager = ProcessedTableManager<
    _$Database,
    $UsersTable,
    User,
    $$UsersTableFilterComposer,
    $$UsersTableOrderingComposer,
    $$UsersTableAnnotationComposer,
    $$UsersTableCreateCompanionBuilder,
    $$UsersTableUpdateCompanionBuilder,
    (User, $$UsersTableReferences),
    User,
    PrefetchHooks Function({bool membersToUsers})>;
typedef $$TimetablesTableCreateCompanionBuilder = TimetablesCompanion Function({
  Value<int> id,
  required String title,
  Value<String?> description,
  required String invitationCode,
  required int startTime,
  required int endTime,
});
typedef $$TimetablesTableUpdateCompanionBuilder = TimetablesCompanion Function({
  Value<int> id,
  Value<String> title,
  Value<String?> description,
  Value<String> invitationCode,
  Value<int> startTime,
  Value<int> endTime,
});

final class $$TimetablesTableReferences
    extends BaseReferences<_$Database, $TimetablesTable, Timetable> {
  $$TimetablesTableReferences(super.$_db, super.$_table, super.$_typedResult);

  static MultiTypedResultKey<$EventsTable, List<Event>> _eventTimetablesTable(
          _$Database db) =>
      MultiTypedResultKey.fromTable(db.events,
          aliasName:
              $_aliasNameGenerator(db.timetables.id, db.events.timetableId));

  $$EventsTableProcessedTableManager get eventTimetables {
    final manager = $$EventsTableTableManager($_db, $_db.events)
        .filter((f) => f.timetableId.id($_item.id));

    final cache = $_typedResult.readTableOrNull(_eventTimetablesTable($_db));
    return ProcessedTableManager(
        manager.$state.copyWith(prefetchedData: cache));
  }

  static MultiTypedResultKey<$TimetableMembersTable, List<TimetableMember>>
      _memberTimetablesTable(_$Database db) =>
          MultiTypedResultKey.fromTable(db.timetableMembers,
              aliasName: $_aliasNameGenerator(
                  db.timetables.id, db.timetableMembers.timetableId));

  $$TimetableMembersTableProcessedTableManager get memberTimetables {
    final manager =
        $$TimetableMembersTableTableManager($_db, $_db.timetableMembers)
            .filter((f) => f.timetableId.id($_item.id));

    final cache = $_typedResult.readTableOrNull(_memberTimetablesTable($_db));
    return ProcessedTableManager(
        manager.$state.copyWith(prefetchedData: cache));
  }
}

class $$TimetablesTableFilterComposer
    extends Composer<_$Database, $TimetablesTable> {
  $$TimetablesTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get title => $composableBuilder(
      column: $table.title, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get description => $composableBuilder(
      column: $table.description, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get invitationCode => $composableBuilder(
      column: $table.invitationCode,
      builder: (column) => ColumnFilters(column));

  ColumnFilters<int> get startTime => $composableBuilder(
      column: $table.startTime, builder: (column) => ColumnFilters(column));

  ColumnFilters<int> get endTime => $composableBuilder(
      column: $table.endTime, builder: (column) => ColumnFilters(column));

  Expression<bool> eventTimetables(
      Expression<bool> Function($$EventsTableFilterComposer f) f) {
    final $$EventsTableFilterComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.id,
        referencedTable: $db.events,
        getReferencedColumn: (t) => t.timetableId,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$EventsTableFilterComposer(
              $db: $db,
              $table: $db.events,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return f(composer);
  }

  Expression<bool> memberTimetables(
      Expression<bool> Function($$TimetableMembersTableFilterComposer f) f) {
    final $$TimetableMembersTableFilterComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.id,
        referencedTable: $db.timetableMembers,
        getReferencedColumn: (t) => t.timetableId,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$TimetableMembersTableFilterComposer(
              $db: $db,
              $table: $db.timetableMembers,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return f(composer);
  }
}

class $$TimetablesTableOrderingComposer
    extends Composer<_$Database, $TimetablesTable> {
  $$TimetablesTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get title => $composableBuilder(
      column: $table.title, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get description => $composableBuilder(
      column: $table.description, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get invitationCode => $composableBuilder(
      column: $table.invitationCode,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get startTime => $composableBuilder(
      column: $table.startTime, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get endTime => $composableBuilder(
      column: $table.endTime, builder: (column) => ColumnOrderings(column));
}

class $$TimetablesTableAnnotationComposer
    extends Composer<_$Database, $TimetablesTable> {
  $$TimetablesTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get title =>
      $composableBuilder(column: $table.title, builder: (column) => column);

  GeneratedColumn<String> get description => $composableBuilder(
      column: $table.description, builder: (column) => column);

  GeneratedColumn<String> get invitationCode => $composableBuilder(
      column: $table.invitationCode, builder: (column) => column);

  GeneratedColumn<int> get startTime =>
      $composableBuilder(column: $table.startTime, builder: (column) => column);

  GeneratedColumn<int> get endTime =>
      $composableBuilder(column: $table.endTime, builder: (column) => column);

  Expression<T> eventTimetables<T extends Object>(
      Expression<T> Function($$EventsTableAnnotationComposer a) f) {
    final $$EventsTableAnnotationComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.id,
        referencedTable: $db.events,
        getReferencedColumn: (t) => t.timetableId,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$EventsTableAnnotationComposer(
              $db: $db,
              $table: $db.events,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return f(composer);
  }

  Expression<T> memberTimetables<T extends Object>(
      Expression<T> Function($$TimetableMembersTableAnnotationComposer a) f) {
    final $$TimetableMembersTableAnnotationComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.id,
        referencedTable: $db.timetableMembers,
        getReferencedColumn: (t) => t.timetableId,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$TimetableMembersTableAnnotationComposer(
              $db: $db,
              $table: $db.timetableMembers,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return f(composer);
  }
}

class $$TimetablesTableTableManager extends RootTableManager<
    _$Database,
    $TimetablesTable,
    Timetable,
    $$TimetablesTableFilterComposer,
    $$TimetablesTableOrderingComposer,
    $$TimetablesTableAnnotationComposer,
    $$TimetablesTableCreateCompanionBuilder,
    $$TimetablesTableUpdateCompanionBuilder,
    (Timetable, $$TimetablesTableReferences),
    Timetable,
    PrefetchHooks Function({bool eventTimetables, bool memberTimetables})> {
  $$TimetablesTableTableManager(_$Database db, $TimetablesTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$TimetablesTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$TimetablesTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$TimetablesTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback: ({
            Value<int> id = const Value.absent(),
            Value<String> title = const Value.absent(),
            Value<String?> description = const Value.absent(),
            Value<String> invitationCode = const Value.absent(),
            Value<int> startTime = const Value.absent(),
            Value<int> endTime = const Value.absent(),
          }) =>
              TimetablesCompanion(
            id: id,
            title: title,
            description: description,
            invitationCode: invitationCode,
            startTime: startTime,
            endTime: endTime,
          ),
          createCompanionCallback: ({
            Value<int> id = const Value.absent(),
            required String title,
            Value<String?> description = const Value.absent(),
            required String invitationCode,
            required int startTime,
            required int endTime,
          }) =>
              TimetablesCompanion.insert(
            id: id,
            title: title,
            description: description,
            invitationCode: invitationCode,
            startTime: startTime,
            endTime: endTime,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) => (
                    e.readTable(table),
                    $$TimetablesTableReferences(db, table, e)
                  ))
              .toList(),
          prefetchHooksCallback: (
              {eventTimetables = false, memberTimetables = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [
                if (eventTimetables) db.events,
                if (memberTimetables) db.timetableMembers
              ],
              addJoins: null,
              getPrefetchedDataCallback: (items) async {
                return [
                  if (eventTimetables)
                    await $_getPrefetchedData(
                        currentTable: table,
                        referencedTable: $$TimetablesTableReferences
                            ._eventTimetablesTable(db),
                        managerFromTypedResult: (p0) =>
                            $$TimetablesTableReferences(db, table, p0)
                                .eventTimetables,
                        referencedItemsForCurrentItem:
                            (item, referencedItems) => referencedItems
                                .where((e) => e.timetableId == item.id),
                        typedResults: items),
                  if (memberTimetables)
                    await $_getPrefetchedData(
                        currentTable: table,
                        referencedTable: $$TimetablesTableReferences
                            ._memberTimetablesTable(db),
                        managerFromTypedResult: (p0) =>
                            $$TimetablesTableReferences(db, table, p0)
                                .memberTimetables,
                        referencedItemsForCurrentItem:
                            (item, referencedItems) => referencedItems
                                .where((e) => e.timetableId == item.id),
                        typedResults: items)
                ];
              },
            );
          },
        ));
}

typedef $$TimetablesTableProcessedTableManager = ProcessedTableManager<
    _$Database,
    $TimetablesTable,
    Timetable,
    $$TimetablesTableFilterComposer,
    $$TimetablesTableOrderingComposer,
    $$TimetablesTableAnnotationComposer,
    $$TimetablesTableCreateCompanionBuilder,
    $$TimetablesTableUpdateCompanionBuilder,
    (Timetable, $$TimetablesTableReferences),
    Timetable,
    PrefetchHooks Function({bool eventTimetables, bool memberTimetables})>;
typedef $$EventsTableCreateCompanionBuilder = EventsCompanion Function({
  Value<int> id,
  required int timetableId,
  required String title,
  Value<String?> description,
  required int day,
  required int startTime,
  required int endTime,
});
typedef $$EventsTableUpdateCompanionBuilder = EventsCompanion Function({
  Value<int> id,
  Value<int> timetableId,
  Value<String> title,
  Value<String?> description,
  Value<int> day,
  Value<int> startTime,
  Value<int> endTime,
});

final class $$EventsTableReferences
    extends BaseReferences<_$Database, $EventsTable, Event> {
  $$EventsTableReferences(super.$_db, super.$_table, super.$_typedResult);

  static $TimetablesTable _timetableIdTable(_$Database db) =>
      db.timetables.createAlias(
          $_aliasNameGenerator(db.events.timetableId, db.timetables.id));

  $$TimetablesTableProcessedTableManager? get timetableId {
    if ($_item.timetableId == null) return null;
    final manager = $$TimetablesTableTableManager($_db, $_db.timetables)
        .filter((f) => f.id($_item.timetableId!));
    final item = $_typedResult.readTableOrNull(_timetableIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
        manager.$state.copyWith(prefetchedData: [item]));
  }

  static MultiTypedResultKey<$EventHostsTable, List<EventHost>>
      _eventHostEventTable(_$Database db) => MultiTypedResultKey.fromTable(
          db.eventHosts,
          aliasName: $_aliasNameGenerator(db.events.id, db.eventHosts.eventId));

  $$EventHostsTableProcessedTableManager get eventHostEvent {
    final manager = $$EventHostsTableTableManager($_db, $_db.eventHosts)
        .filter((f) => f.eventId.id($_item.id));

    final cache = $_typedResult.readTableOrNull(_eventHostEventTable($_db));
    return ProcessedTableManager(
        manager.$state.copyWith(prefetchedData: cache));
  }
}

class $$EventsTableFilterComposer extends Composer<_$Database, $EventsTable> {
  $$EventsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get title => $composableBuilder(
      column: $table.title, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get description => $composableBuilder(
      column: $table.description, builder: (column) => ColumnFilters(column));

  ColumnFilters<int> get day => $composableBuilder(
      column: $table.day, builder: (column) => ColumnFilters(column));

  ColumnFilters<int> get startTime => $composableBuilder(
      column: $table.startTime, builder: (column) => ColumnFilters(column));

  ColumnFilters<int> get endTime => $composableBuilder(
      column: $table.endTime, builder: (column) => ColumnFilters(column));

  $$TimetablesTableFilterComposer get timetableId {
    final $$TimetablesTableFilterComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.timetableId,
        referencedTable: $db.timetables,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$TimetablesTableFilterComposer(
              $db: $db,
              $table: $db.timetables,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }

  Expression<bool> eventHostEvent(
      Expression<bool> Function($$EventHostsTableFilterComposer f) f) {
    final $$EventHostsTableFilterComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.id,
        referencedTable: $db.eventHosts,
        getReferencedColumn: (t) => t.eventId,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$EventHostsTableFilterComposer(
              $db: $db,
              $table: $db.eventHosts,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return f(composer);
  }
}

class $$EventsTableOrderingComposer extends Composer<_$Database, $EventsTable> {
  $$EventsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get title => $composableBuilder(
      column: $table.title, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get description => $composableBuilder(
      column: $table.description, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get day => $composableBuilder(
      column: $table.day, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get startTime => $composableBuilder(
      column: $table.startTime, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get endTime => $composableBuilder(
      column: $table.endTime, builder: (column) => ColumnOrderings(column));

  $$TimetablesTableOrderingComposer get timetableId {
    final $$TimetablesTableOrderingComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.timetableId,
        referencedTable: $db.timetables,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$TimetablesTableOrderingComposer(
              $db: $db,
              $table: $db.timetables,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }
}

class $$EventsTableAnnotationComposer
    extends Composer<_$Database, $EventsTable> {
  $$EventsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get title =>
      $composableBuilder(column: $table.title, builder: (column) => column);

  GeneratedColumn<String> get description => $composableBuilder(
      column: $table.description, builder: (column) => column);

  GeneratedColumn<int> get day =>
      $composableBuilder(column: $table.day, builder: (column) => column);

  GeneratedColumn<int> get startTime =>
      $composableBuilder(column: $table.startTime, builder: (column) => column);

  GeneratedColumn<int> get endTime =>
      $composableBuilder(column: $table.endTime, builder: (column) => column);

  $$TimetablesTableAnnotationComposer get timetableId {
    final $$TimetablesTableAnnotationComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.timetableId,
        referencedTable: $db.timetables,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$TimetablesTableAnnotationComposer(
              $db: $db,
              $table: $db.timetables,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }

  Expression<T> eventHostEvent<T extends Object>(
      Expression<T> Function($$EventHostsTableAnnotationComposer a) f) {
    final $$EventHostsTableAnnotationComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.id,
        referencedTable: $db.eventHosts,
        getReferencedColumn: (t) => t.eventId,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$EventHostsTableAnnotationComposer(
              $db: $db,
              $table: $db.eventHosts,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return f(composer);
  }
}

class $$EventsTableTableManager extends RootTableManager<
    _$Database,
    $EventsTable,
    Event,
    $$EventsTableFilterComposer,
    $$EventsTableOrderingComposer,
    $$EventsTableAnnotationComposer,
    $$EventsTableCreateCompanionBuilder,
    $$EventsTableUpdateCompanionBuilder,
    (Event, $$EventsTableReferences),
    Event,
    PrefetchHooks Function({bool timetableId, bool eventHostEvent})> {
  $$EventsTableTableManager(_$Database db, $EventsTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$EventsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$EventsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$EventsTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback: ({
            Value<int> id = const Value.absent(),
            Value<int> timetableId = const Value.absent(),
            Value<String> title = const Value.absent(),
            Value<String?> description = const Value.absent(),
            Value<int> day = const Value.absent(),
            Value<int> startTime = const Value.absent(),
            Value<int> endTime = const Value.absent(),
          }) =>
              EventsCompanion(
            id: id,
            timetableId: timetableId,
            title: title,
            description: description,
            day: day,
            startTime: startTime,
            endTime: endTime,
          ),
          createCompanionCallback: ({
            Value<int> id = const Value.absent(),
            required int timetableId,
            required String title,
            Value<String?> description = const Value.absent(),
            required int day,
            required int startTime,
            required int endTime,
          }) =>
              EventsCompanion.insert(
            id: id,
            timetableId: timetableId,
            title: title,
            description: description,
            day: day,
            startTime: startTime,
            endTime: endTime,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) =>
                  (e.readTable(table), $$EventsTableReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: (
              {timetableId = false, eventHostEvent = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [if (eventHostEvent) db.eventHosts],
              addJoins: <
                  T extends TableManagerState<
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic>>(state) {
                if (timetableId) {
                  state = state.withJoin(
                    currentTable: table,
                    currentColumn: table.timetableId,
                    referencedTable:
                        $$EventsTableReferences._timetableIdTable(db),
                    referencedColumn:
                        $$EventsTableReferences._timetableIdTable(db).id,
                  ) as T;
                }

                return state;
              },
              getPrefetchedDataCallback: (items) async {
                return [
                  if (eventHostEvent)
                    await $_getPrefetchedData(
                        currentTable: table,
                        referencedTable:
                            $$EventsTableReferences._eventHostEventTable(db),
                        managerFromTypedResult: (p0) =>
                            $$EventsTableReferences(db, table, p0)
                                .eventHostEvent,
                        referencedItemsForCurrentItem: (item,
                                referencedItems) =>
                            referencedItems.where((e) => e.eventId == item.id),
                        typedResults: items)
                ];
              },
            );
          },
        ));
}

typedef $$EventsTableProcessedTableManager = ProcessedTableManager<
    _$Database,
    $EventsTable,
    Event,
    $$EventsTableFilterComposer,
    $$EventsTableOrderingComposer,
    $$EventsTableAnnotationComposer,
    $$EventsTableCreateCompanionBuilder,
    $$EventsTableUpdateCompanionBuilder,
    (Event, $$EventsTableReferences),
    Event,
    PrefetchHooks Function({bool timetableId, bool eventHostEvent})>;
typedef $$TimetableMembersTableCreateCompanionBuilder
    = TimetableMembersCompanion Function({
  Value<int> id,
  required int userId,
  required int timetableId,
  Value<TimetableMemberRoles> role,
});
typedef $$TimetableMembersTableUpdateCompanionBuilder
    = TimetableMembersCompanion Function({
  Value<int> id,
  Value<int> userId,
  Value<int> timetableId,
  Value<TimetableMemberRoles> role,
});

final class $$TimetableMembersTableReferences extends BaseReferences<_$Database,
    $TimetableMembersTable, TimetableMember> {
  $$TimetableMembersTableReferences(
      super.$_db, super.$_table, super.$_typedResult);

  static $UsersTable _userIdTable(_$Database db) => db.users.createAlias(
      $_aliasNameGenerator(db.timetableMembers.userId, db.users.id));

  $$UsersTableProcessedTableManager? get userId {
    if ($_item.userId == null) return null;
    final manager = $$UsersTableTableManager($_db, $_db.users)
        .filter((f) => f.id($_item.userId!));
    final item = $_typedResult.readTableOrNull(_userIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
        manager.$state.copyWith(prefetchedData: [item]));
  }

  static $TimetablesTable _timetableIdTable(_$Database db) =>
      db.timetables.createAlias($_aliasNameGenerator(
          db.timetableMembers.timetableId, db.timetables.id));

  $$TimetablesTableProcessedTableManager? get timetableId {
    if ($_item.timetableId == null) return null;
    final manager = $$TimetablesTableTableManager($_db, $_db.timetables)
        .filter((f) => f.id($_item.timetableId!));
    final item = $_typedResult.readTableOrNull(_timetableIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
        manager.$state.copyWith(prefetchedData: [item]));
  }

  static MultiTypedResultKey<$EventHostsTable, List<EventHost>>
      _eventHostMembersTable(_$Database db) =>
          MultiTypedResultKey.fromTable(db.eventHosts,
              aliasName: $_aliasNameGenerator(
                  db.timetableMembers.id, db.eventHosts.memberId));

  $$EventHostsTableProcessedTableManager get eventHostMembers {
    final manager = $$EventHostsTableTableManager($_db, $_db.eventHosts)
        .filter((f) => f.memberId.id($_item.id));

    final cache = $_typedResult.readTableOrNull(_eventHostMembersTable($_db));
    return ProcessedTableManager(
        manager.$state.copyWith(prefetchedData: cache));
  }
}

class $$TimetableMembersTableFilterComposer
    extends Composer<_$Database, $TimetableMembersTable> {
  $$TimetableMembersTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnFilters(column));

  ColumnWithTypeConverterFilters<TimetableMemberRoles, TimetableMemberRoles,
          String>
      get role => $composableBuilder(
          column: $table.role,
          builder: (column) => ColumnWithTypeConverterFilters(column));

  $$UsersTableFilterComposer get userId {
    final $$UsersTableFilterComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.userId,
        referencedTable: $db.users,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$UsersTableFilterComposer(
              $db: $db,
              $table: $db.users,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }

  $$TimetablesTableFilterComposer get timetableId {
    final $$TimetablesTableFilterComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.timetableId,
        referencedTable: $db.timetables,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$TimetablesTableFilterComposer(
              $db: $db,
              $table: $db.timetables,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }

  Expression<bool> eventHostMembers(
      Expression<bool> Function($$EventHostsTableFilterComposer f) f) {
    final $$EventHostsTableFilterComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.id,
        referencedTable: $db.eventHosts,
        getReferencedColumn: (t) => t.memberId,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$EventHostsTableFilterComposer(
              $db: $db,
              $table: $db.eventHosts,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return f(composer);
  }
}

class $$TimetableMembersTableOrderingComposer
    extends Composer<_$Database, $TimetableMembersTable> {
  $$TimetableMembersTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get role => $composableBuilder(
      column: $table.role, builder: (column) => ColumnOrderings(column));

  $$UsersTableOrderingComposer get userId {
    final $$UsersTableOrderingComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.userId,
        referencedTable: $db.users,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$UsersTableOrderingComposer(
              $db: $db,
              $table: $db.users,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }

  $$TimetablesTableOrderingComposer get timetableId {
    final $$TimetablesTableOrderingComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.timetableId,
        referencedTable: $db.timetables,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$TimetablesTableOrderingComposer(
              $db: $db,
              $table: $db.timetables,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }
}

class $$TimetableMembersTableAnnotationComposer
    extends Composer<_$Database, $TimetableMembersTable> {
  $$TimetableMembersTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumnWithTypeConverter<TimetableMemberRoles, String> get role =>
      $composableBuilder(column: $table.role, builder: (column) => column);

  $$UsersTableAnnotationComposer get userId {
    final $$UsersTableAnnotationComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.userId,
        referencedTable: $db.users,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$UsersTableAnnotationComposer(
              $db: $db,
              $table: $db.users,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }

  $$TimetablesTableAnnotationComposer get timetableId {
    final $$TimetablesTableAnnotationComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.timetableId,
        referencedTable: $db.timetables,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$TimetablesTableAnnotationComposer(
              $db: $db,
              $table: $db.timetables,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }

  Expression<T> eventHostMembers<T extends Object>(
      Expression<T> Function($$EventHostsTableAnnotationComposer a) f) {
    final $$EventHostsTableAnnotationComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.id,
        referencedTable: $db.eventHosts,
        getReferencedColumn: (t) => t.memberId,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$EventHostsTableAnnotationComposer(
              $db: $db,
              $table: $db.eventHosts,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return f(composer);
  }
}

class $$TimetableMembersTableTableManager extends RootTableManager<
    _$Database,
    $TimetableMembersTable,
    TimetableMember,
    $$TimetableMembersTableFilterComposer,
    $$TimetableMembersTableOrderingComposer,
    $$TimetableMembersTableAnnotationComposer,
    $$TimetableMembersTableCreateCompanionBuilder,
    $$TimetableMembersTableUpdateCompanionBuilder,
    (TimetableMember, $$TimetableMembersTableReferences),
    TimetableMember,
    PrefetchHooks Function(
        {bool userId, bool timetableId, bool eventHostMembers})> {
  $$TimetableMembersTableTableManager(
      _$Database db, $TimetableMembersTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$TimetableMembersTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$TimetableMembersTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$TimetableMembersTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback: ({
            Value<int> id = const Value.absent(),
            Value<int> userId = const Value.absent(),
            Value<int> timetableId = const Value.absent(),
            Value<TimetableMemberRoles> role = const Value.absent(),
          }) =>
              TimetableMembersCompanion(
            id: id,
            userId: userId,
            timetableId: timetableId,
            role: role,
          ),
          createCompanionCallback: ({
            Value<int> id = const Value.absent(),
            required int userId,
            required int timetableId,
            Value<TimetableMemberRoles> role = const Value.absent(),
          }) =>
              TimetableMembersCompanion.insert(
            id: id,
            userId: userId,
            timetableId: timetableId,
            role: role,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) => (
                    e.readTable(table),
                    $$TimetableMembersTableReferences(db, table, e)
                  ))
              .toList(),
          prefetchHooksCallback: (
              {userId = false, timetableId = false, eventHostMembers = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [if (eventHostMembers) db.eventHosts],
              addJoins: <
                  T extends TableManagerState<
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic>>(state) {
                if (userId) {
                  state = state.withJoin(
                    currentTable: table,
                    currentColumn: table.userId,
                    referencedTable:
                        $$TimetableMembersTableReferences._userIdTable(db),
                    referencedColumn:
                        $$TimetableMembersTableReferences._userIdTable(db).id,
                  ) as T;
                }
                if (timetableId) {
                  state = state.withJoin(
                    currentTable: table,
                    currentColumn: table.timetableId,
                    referencedTable:
                        $$TimetableMembersTableReferences._timetableIdTable(db),
                    referencedColumn: $$TimetableMembersTableReferences
                        ._timetableIdTable(db)
                        .id,
                  ) as T;
                }

                return state;
              },
              getPrefetchedDataCallback: (items) async {
                return [
                  if (eventHostMembers)
                    await $_getPrefetchedData(
                        currentTable: table,
                        referencedTable: $$TimetableMembersTableReferences
                            ._eventHostMembersTable(db),
                        managerFromTypedResult: (p0) =>
                            $$TimetableMembersTableReferences(db, table, p0)
                                .eventHostMembers,
                        referencedItemsForCurrentItem: (item,
                                referencedItems) =>
                            referencedItems.where((e) => e.memberId == item.id),
                        typedResults: items)
                ];
              },
            );
          },
        ));
}

typedef $$TimetableMembersTableProcessedTableManager = ProcessedTableManager<
    _$Database,
    $TimetableMembersTable,
    TimetableMember,
    $$TimetableMembersTableFilterComposer,
    $$TimetableMembersTableOrderingComposer,
    $$TimetableMembersTableAnnotationComposer,
    $$TimetableMembersTableCreateCompanionBuilder,
    $$TimetableMembersTableUpdateCompanionBuilder,
    (TimetableMember, $$TimetableMembersTableReferences),
    TimetableMember,
    PrefetchHooks Function(
        {bool userId, bool timetableId, bool eventHostMembers})>;
typedef $$EventHostsTableCreateCompanionBuilder = EventHostsCompanion Function({
  Value<int> id,
  required int memberId,
  required int eventId,
});
typedef $$EventHostsTableUpdateCompanionBuilder = EventHostsCompanion Function({
  Value<int> id,
  Value<int> memberId,
  Value<int> eventId,
});

final class $$EventHostsTableReferences
    extends BaseReferences<_$Database, $EventHostsTable, EventHost> {
  $$EventHostsTableReferences(super.$_db, super.$_table, super.$_typedResult);

  static $TimetableMembersTable _memberIdTable(_$Database db) =>
      db.timetableMembers.createAlias(
          $_aliasNameGenerator(db.eventHosts.memberId, db.timetableMembers.id));

  $$TimetableMembersTableProcessedTableManager? get memberId {
    if ($_item.memberId == null) return null;
    final manager =
        $$TimetableMembersTableTableManager($_db, $_db.timetableMembers)
            .filter((f) => f.id($_item.memberId!));
    final item = $_typedResult.readTableOrNull(_memberIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
        manager.$state.copyWith(prefetchedData: [item]));
  }

  static $EventsTable _eventIdTable(_$Database db) => db.events
      .createAlias($_aliasNameGenerator(db.eventHosts.eventId, db.events.id));

  $$EventsTableProcessedTableManager? get eventId {
    if ($_item.eventId == null) return null;
    final manager = $$EventsTableTableManager($_db, $_db.events)
        .filter((f) => f.id($_item.eventId!));
    final item = $_typedResult.readTableOrNull(_eventIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
        manager.$state.copyWith(prefetchedData: [item]));
  }
}

class $$EventHostsTableFilterComposer
    extends Composer<_$Database, $EventHostsTable> {
  $$EventHostsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnFilters(column));

  $$TimetableMembersTableFilterComposer get memberId {
    final $$TimetableMembersTableFilterComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.memberId,
        referencedTable: $db.timetableMembers,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$TimetableMembersTableFilterComposer(
              $db: $db,
              $table: $db.timetableMembers,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }

  $$EventsTableFilterComposer get eventId {
    final $$EventsTableFilterComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.eventId,
        referencedTable: $db.events,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$EventsTableFilterComposer(
              $db: $db,
              $table: $db.events,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }
}

class $$EventHostsTableOrderingComposer
    extends Composer<_$Database, $EventHostsTable> {
  $$EventHostsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnOrderings(column));

  $$TimetableMembersTableOrderingComposer get memberId {
    final $$TimetableMembersTableOrderingComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.memberId,
        referencedTable: $db.timetableMembers,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$TimetableMembersTableOrderingComposer(
              $db: $db,
              $table: $db.timetableMembers,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }

  $$EventsTableOrderingComposer get eventId {
    final $$EventsTableOrderingComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.eventId,
        referencedTable: $db.events,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$EventsTableOrderingComposer(
              $db: $db,
              $table: $db.events,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }
}

class $$EventHostsTableAnnotationComposer
    extends Composer<_$Database, $EventHostsTable> {
  $$EventHostsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  $$TimetableMembersTableAnnotationComposer get memberId {
    final $$TimetableMembersTableAnnotationComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.memberId,
        referencedTable: $db.timetableMembers,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$TimetableMembersTableAnnotationComposer(
              $db: $db,
              $table: $db.timetableMembers,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }

  $$EventsTableAnnotationComposer get eventId {
    final $$EventsTableAnnotationComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.eventId,
        referencedTable: $db.events,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$EventsTableAnnotationComposer(
              $db: $db,
              $table: $db.events,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }
}

class $$EventHostsTableTableManager extends RootTableManager<
    _$Database,
    $EventHostsTable,
    EventHost,
    $$EventHostsTableFilterComposer,
    $$EventHostsTableOrderingComposer,
    $$EventHostsTableAnnotationComposer,
    $$EventHostsTableCreateCompanionBuilder,
    $$EventHostsTableUpdateCompanionBuilder,
    (EventHost, $$EventHostsTableReferences),
    EventHost,
    PrefetchHooks Function({bool memberId, bool eventId})> {
  $$EventHostsTableTableManager(_$Database db, $EventHostsTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$EventHostsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$EventHostsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$EventHostsTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback: ({
            Value<int> id = const Value.absent(),
            Value<int> memberId = const Value.absent(),
            Value<int> eventId = const Value.absent(),
          }) =>
              EventHostsCompanion(
            id: id,
            memberId: memberId,
            eventId: eventId,
          ),
          createCompanionCallback: ({
            Value<int> id = const Value.absent(),
            required int memberId,
            required int eventId,
          }) =>
              EventHostsCompanion.insert(
            id: id,
            memberId: memberId,
            eventId: eventId,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) => (
                    e.readTable(table),
                    $$EventHostsTableReferences(db, table, e)
                  ))
              .toList(),
          prefetchHooksCallback: ({memberId = false, eventId = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [],
              addJoins: <
                  T extends TableManagerState<
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic>>(state) {
                if (memberId) {
                  state = state.withJoin(
                    currentTable: table,
                    currentColumn: table.memberId,
                    referencedTable:
                        $$EventHostsTableReferences._memberIdTable(db),
                    referencedColumn:
                        $$EventHostsTableReferences._memberIdTable(db).id,
                  ) as T;
                }
                if (eventId) {
                  state = state.withJoin(
                    currentTable: table,
                    currentColumn: table.eventId,
                    referencedTable:
                        $$EventHostsTableReferences._eventIdTable(db),
                    referencedColumn:
                        $$EventHostsTableReferences._eventIdTable(db).id,
                  ) as T;
                }

                return state;
              },
              getPrefetchedDataCallback: (items) async {
                return [];
              },
            );
          },
        ));
}

typedef $$EventHostsTableProcessedTableManager = ProcessedTableManager<
    _$Database,
    $EventHostsTable,
    EventHost,
    $$EventHostsTableFilterComposer,
    $$EventHostsTableOrderingComposer,
    $$EventHostsTableAnnotationComposer,
    $$EventHostsTableCreateCompanionBuilder,
    $$EventHostsTableUpdateCompanionBuilder,
    (EventHost, $$EventHostsTableReferences),
    EventHost,
    PrefetchHooks Function({bool memberId, bool eventId})>;

class $DatabaseManager {
  final _$Database _db;
  $DatabaseManager(this._db);
  $$UsersTableTableManager get users =>
      $$UsersTableTableManager(_db, _db.users);
  $$TimetablesTableTableManager get timetables =>
      $$TimetablesTableTableManager(_db, _db.timetables);
  $$EventsTableTableManager get events =>
      $$EventsTableTableManager(_db, _db.events);
  $$TimetableMembersTableTableManager get timetableMembers =>
      $$TimetableMembersTableTableManager(_db, _db.timetableMembers);
  $$EventHostsTableTableManager get eventHosts =>
      $$EventHostsTableTableManager(_db, _db.eventHosts);
}
