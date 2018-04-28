/*
 * Tencent is pleased to support the open source community by making
 * WCDB available.
 *
 * Copyright (C) 2017 THL A29 Limited, a Tencent company.
 * All rights reserved.
 *
 * Licensed under the BSD 3-Clause License (the "License"); you may not use
 * this file except in compliance with the License. You may obtain a copy of
 * the License at
 *
 *       https://opensource.org/licenses/BSD-3-Clause
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

#import "WINQTestCase.h"

@interface StatementCreateTriggerTests : WINQTestCase

@end

@implementation StatementCreateTriggerTests

- (void)testStatementCreateTrigger
{
    XCTAssertEqual(WCDB::StatementCreateTrigger().getType(), WCDB::Statement::Type::CreateTrigger);

    WINQAssertEqual(WCDB::StatementCreateTrigger()
                        .createTrigger(self.class.triggerName)
                        .ifNotExists(false)
                        .withSchema(self.class.schemaName)
                        .before()
                        .delete_()
                        .on(self.class.tableName)
                        .forEachRow()
                        .when(self.class.condition)
                        .run(self.class.statementUpdate),
                    @"CREATE TRIGGER testSchema.testTrigger BEFORE DELETE ON testTable FOR EACH ROW WHEN testColumn NOTNULL BEGIN UPDATE main.testTable SET testColumn = 1; END");

    WINQAssertEqual(WCDB::StatementCreateTrigger()
                        .createTrigger(self.class.triggerName)
                        .ifNotExists(false)
                        .withSchema(self.class.schemaName)
                        .before()
                        .delete_()
                        .on(self.class.tableName)
                        .forEachRow()
                        .when(self.class.condition)
                        .run(self.class.statementInsert),
                    @"CREATE TRIGGER testSchema.testTrigger BEFORE DELETE ON testTable FOR EACH ROW WHEN testColumn NOTNULL BEGIN INSERT INTO main.testTable VALUES(1); END");

    WINQAssertEqual(WCDB::StatementCreateTrigger()
                        .createTrigger(self.class.triggerName)
                        .ifNotExists(false)
                        .withSchema(self.class.schemaName)
                        .before()
                        .delete_()
                        .on(self.class.tableName)
                        .forEachRow()
                        .when(self.class.condition)
                        .run(self.class.statementDelete),
                    @"CREATE TRIGGER testSchema.testTrigger BEFORE DELETE ON testTable FOR EACH ROW WHEN testColumn NOTNULL BEGIN DELETE FROM main.testTable; END");

    WINQAssertEqual(WCDB::StatementCreateTrigger()
                        .createTrigger(self.class.triggerName)
                        .ifNotExists(false)
                        .withSchema(self.class.schemaName)
                        .before()
                        .delete_()
                        .on(self.class.tableName)
                        .forEachRow()
                        .when(self.class.condition)
                        .run(self.class.statementSelect),
                    @"CREATE TRIGGER testSchema.testTrigger BEFORE DELETE ON testTable FOR EACH ROW WHEN testColumn NOTNULL BEGIN SELECT testColumn FROM main.testTable; END");

    WINQAssertEqual(WCDB::StatementCreateTrigger()
                        .createTrigger(self.class.triggerName)
                        .ifNotExists(false)
                        .withSchema(self.class.schemaName)
                        .before()
                        .delete_()
                        .on(self.class.tableName)
                        .forEachRow()
                        .when(self.class.condition)
                        .run(self.class.statementUpdate)
                        .run(self.class.statementInsert)
                        .run(self.class.statementDelete)
                        .run(self.class.statementSelect),
                    @"CREATE TRIGGER testSchema.testTrigger BEFORE DELETE ON testTable FOR EACH ROW WHEN testColumn NOTNULL BEGIN UPDATE main.testTable SET testColumn = 1; INSERT INTO main.testTable VALUES(1); DELETE FROM main.testTable; SELECT testColumn FROM main.testTable; END");

    WINQAssertEqual(WCDB::StatementCreateTrigger()
                        .createTrigger(self.class.triggerName)
                        .ifNotExists(false)
                        .withSchema(self.class.schemaName)
                        .before()
                        .delete_()
                        .on(self.class.tableName)
                        .forEachRow()
                        .run(self.class.statementUpdate),
                    @"CREATE TRIGGER testSchema.testTrigger BEFORE DELETE ON testTable FOR EACH ROW BEGIN UPDATE main.testTable SET testColumn = 1; END");

    WINQAssertEqual(WCDB::StatementCreateTrigger()
                        .createTrigger(self.class.triggerName)
                        .ifNotExists(false)
                        .withSchema(self.class.schemaName)
                        .before()
                        .insert()
                        .on(self.class.tableName)
                        .when(self.class.condition)
                        .run(self.class.statementUpdate),
                    @"CREATE TRIGGER testSchema.testTrigger BEFORE INSERT ON testTable WHEN testColumn NOTNULL BEGIN UPDATE main.testTable SET testColumn = 1; END");

    WINQAssertEqual(WCDB::StatementCreateTrigger()
                        .createTrigger(self.class.triggerName)
                        .ifNotExists(false)
                        .withSchema(self.class.schemaName)
                        .before()
                        .update()
                        .on(self.class.tableName)
                        .forEachRow()
                        .when(self.class.condition)
                        .run(self.class.statementUpdate),
                    @"CREATE TRIGGER testSchema.testTrigger BEFORE UPDATE ON testTable FOR EACH ROW WHEN testColumn NOTNULL BEGIN UPDATE main.testTable SET testColumn = 1; END");

    WINQAssertEqual(WCDB::StatementCreateTrigger()
                        .createTrigger(self.class.triggerName)
                        .ifNotExists(false)
                        .withSchema(self.class.schemaName)
                        .before()
                        .updateOf(self.class.column)
                        .on(self.class.tableName)
                        .forEachRow()
                        .when(self.class.condition)
                        .run(self.class.statementUpdate),
                    @"CREATE TRIGGER testSchema.testTrigger BEFORE UPDATE OF testColumn ON testTable FOR EACH ROW WHEN testColumn NOTNULL BEGIN UPDATE main.testTable SET testColumn = 1; END");

    WINQAssertEqual(WCDB::StatementCreateTrigger()
                        .createTrigger(self.class.triggerName)
                        .ifNotExists(false)
                        .withSchema(self.class.schemaName)
                        .before()
                        .updateOf(self.class.columns)
                        .on(self.class.tableName)
                        .forEachRow()
                        .when(self.class.condition)
                        .run(self.class.statementUpdate),
                    @"CREATE TRIGGER testSchema.testTrigger BEFORE UPDATE OF testColumn, testColumn2 ON testTable FOR EACH ROW WHEN testColumn NOTNULL BEGIN UPDATE main.testTable SET testColumn = 1; END");

    WINQAssertEqual(WCDB::StatementCreateTrigger()
                        .createTrigger(self.class.triggerName)
                        .ifNotExists(false)
                        .withSchema(self.class.schemaName)
                        .after()
                        .delete_()
                        .on(self.class.tableName)
                        .forEachRow()
                        .when(self.class.condition)
                        .run(self.class.statementUpdate),
                    @"CREATE TRIGGER testSchema.testTrigger AFTER DELETE ON testTable FOR EACH ROW WHEN testColumn NOTNULL BEGIN UPDATE main.testTable SET testColumn = 1; END");

    WINQAssertEqual(WCDB::StatementCreateTrigger()
                        .createTrigger(self.class.triggerName)
                        .ifNotExists(false)
                        .withSchema(self.class.schemaName)
                        .insteadOf()
                        .delete_()
                        .on(self.class.tableName)
                        .forEachRow()
                        .when(self.class.condition)
                        .run(self.class.statementUpdate),
                    @"CREATE TRIGGER testSchema.testTrigger INSTEAD OF DELETE ON testTable FOR EACH ROW WHEN testColumn NOTNULL BEGIN UPDATE main.testTable SET testColumn = 1; END");

    WINQAssertEqual(WCDB::StatementCreateTrigger()
                        .createTrigger(self.class.triggerName)
                        .ifNotExists(false)
                        .withSchema(self.class.schemaName)
                        .delete_()
                        .on(self.class.tableName)
                        .forEachRow()
                        .when(self.class.condition)
                        .run(self.class.statementUpdate),
                    @"CREATE TRIGGER testSchema.testTrigger DELETE ON testTable FOR EACH ROW WHEN testColumn NOTNULL BEGIN UPDATE main.testTable SET testColumn = 1; END");

    WINQAssertEqual(WCDB::StatementCreateTrigger()
                        .createTrigger(self.class.triggerName)
                        .ifNotExists(false)
                        .before()
                        .delete_()
                        .on(self.class.tableName)
                        .forEachRow()
                        .when(self.class.condition)
                        .run(self.class.statementUpdate),
                    @"CREATE TRIGGER main.testTrigger BEFORE DELETE ON testTable FOR EACH ROW WHEN testColumn NOTNULL BEGIN UPDATE main.testTable SET testColumn = 1; END");

    WINQAssertEqual(WCDB::StatementCreateTrigger()
                        .createTrigger(self.class.triggerName)
                        .ifNotExists(true)
                        .withSchema(self.class.schemaName)
                        .before()
                        .delete_()
                        .on(self.class.tableName)
                        .forEachRow()
                        .when(self.class.condition)
                        .run(self.class.statementUpdate),
                    @"CREATE TRIGGER IF NOT EXISTS testSchema.testTrigger BEFORE DELETE ON testTable FOR EACH ROW WHEN testColumn NOTNULL BEGIN UPDATE main.testTable SET testColumn = 1; END");

    WINQAssertEqual(WCDB::StatementCreateTrigger()
                        .createTrigger(self.class.triggerName)
                        .temp()
                        .ifNotExists(false)
                        .withSchema(self.class.schemaName)
                        .before()
                        .delete_()
                        .on(self.class.tableName)
                        .forEachRow()
                        .when(self.class.condition)
                        .run(self.class.statementUpdate),
                    @"CREATE TEMP TRIGGER testSchema.testTrigger BEFORE DELETE ON testTable FOR EACH ROW WHEN testColumn NOTNULL BEGIN UPDATE main.testTable SET testColumn = 1; END");

    //Default
    WINQAssertEqual(WCDB::StatementCreateTrigger()
                        .createTrigger(self.class.triggerName)
                        .withSchema(self.class.schemaName)
                        .before()
                        .delete_()
                        .on(self.class.tableName)
                        .forEachRow()
                        .when(self.class.condition)
                        .run(self.class.statementUpdate),
                    @"CREATE TRIGGER IF NOT EXISTS testSchema.testTrigger BEFORE DELETE ON testTable FOR EACH ROW WHEN testColumn NOTNULL BEGIN UPDATE main.testTable SET testColumn = 1; END");
}

@end
